import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_test_app/data/local_data_source/shared_preference_service.dart';
import 'package:flutter_chat_test_app/data/models/chat_model.dart';
import 'package:flutter_chat_test_app/data/remote_data_source/socket/chat_web_socket_service.dart';
import 'package:flutter_chat_test_app/domain/repositories/socket/chat_web_socket_repository.dart';
import 'package:rxdart/rxdart.dart';

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
    stream.bufferTime(const Duration(milliseconds: 30));
    _chatWebSocketRepository.connect();
    _streamSubscription =
        _chatWebSocketRepository.socketStream.bufferTime(const Duration(milliseconds: 30)).listen((data) {
      if (data.isNotEmpty) {
        final List<ChatEntity> newMap = data.map((e) => e as ChatEntity).toList();
        add(ChatReceiveEvent(newMap));
      }
    });

    on<ChatReceiveEvent>((event, emit) async {
      final List<ChatEntity> newEntity = event.data
          .map((e) =>
              ChatEntity(name: e.name, myMessage: _sharedPreferenceService.username == e.name, message: e.message))
          .toList();

      _chatList.addAll(newEntity);
      emit(ChatReceiveState(_chatList.reversed.toList()));
    });

    on<ChatSendEvent>(
      (event, emit) async {
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

  @override
  void onTransition(Transition<ChatEvent, ChatState> transition) {
    if (transition.event is ChatSendEvent) {}
    super.onTransition(transition);
  }
}
