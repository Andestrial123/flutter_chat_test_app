import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_chat_test_app/config/nerwork_config.dart';
import 'package:flutter_chat_test_app/data/local_data_source/shared_preference_service.dart';
import 'package:flutter_chat_test_app/data/remote_data_source/api/api_client.dart';
import 'package:flutter_chat_test_app/data/remote_data_source/socket/chat_web_socket_service.dart';
import 'package:flutter_chat_test_app/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter_chat_test_app/data/repository/socket/chat_web_socket_repository.dart';
import 'package:flutter_chat_test_app/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_chat_test_app/domain/repositories/socket/chat_web_socket_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.asNewInstance();

Future<void> setup() async {
  // Configs
  getIt.registerSingleton<NetworkConfig>(NetworkConfigDefault());

  //Locale Data Source
  getIt.registerSingleton<SharedPreferenceService>(SharedPreferenceServiceImpl(await SharedPreferences.getInstance()));
  //Remote Data Sources
  getIt
    ..registerSingleton<Dio>(_getDio())
    ..registerSingleton<ApiClient>(ApiClient(getIt()));

  // Network
  getIt.registerSingleton<Connectivity>(Connectivity());

  //Services
  getIt.registerSingleton<ChatWebSocketService>(
      ChatWebSocketService(getIt(), url: getIt<NetworkConfig>().baseSocketUrl));

  // Repositories
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt(), getIt()));
  getIt.registerSingleton<ChatWebSocketRepository>(ChatWebSocketRepositoryImpl(getIt()));


}

Dio _getDio() {
  Dio dio = Dio();

  dio.options.baseUrl = getIt<NetworkConfig>().baseUrl;
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
}
