import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_test_app/data/local_data_source/shared_preference_service.dart';
import 'package:flutter_chat_test_app/data/models/chat_model.dart';
import 'package:flutter_chat_test_app/domain/repositories/socket/chat_web_socket_repository.dart';

import '../../../domain/entity/chat_entity.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatWebSocketRepository _chatWebSocketRepository;
  final SharedPreferenceService _sharedPreferenceService;

  late final StreamSubscription _streamSubscription;

  final List<ChatEntity> _chatList = [];

  ChatBloc(this._chatWebSocketRepository, this._sharedPreferenceService)
      : super(
          ChatReceiveState(const []),
        ) {
    _chatWebSocketRepository.connect();
    _streamSubscription = _chatWebSocketRepository.socketStream.listen((data) {
      add(ChatReceiveEvent(data));
    });
    on<ChatReceiveEvent>((event, emit) {
      final ChatEntity newEntity = ChatEntity(
        name: event.data.name,
        message: event.data.message,
        myMessage: _sharedPreferenceService.username == event.data.name,
      );
      _chatList.add(newEntity);
      emit(ChatReceiveState(_chatList.reversed.toList()));
    });

    on<ChatSendEvent>(
      (event, emit) {
        final Map<String, dynamic> eventData = ChatModel(
          name: _sharedPreferenceService.username,
          message: event.data,
        ).toJson();

        final stringData = jsonEncode(eventData);
        _chatWebSocketRepository.sendMessage(stringData);
      },
    );
  }

  @override
  Future<void> close() {
    _chatWebSocketRepository.disconnect();
    _streamSubscription.cancel();
    return super.close();
  }
}
