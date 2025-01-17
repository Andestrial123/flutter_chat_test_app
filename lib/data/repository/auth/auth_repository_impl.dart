import 'dart:developer';

import 'package:flutter_chat_test_app/config/constants/storage_constants.dart';
import 'package:flutter_chat_test_app/data/local_data_source/shared_preference_service.dart';
import 'package:flutter_chat_test_app/data/remote_data_source/api/api_client.dart';

import '../../../domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  final SharedPreferenceService _sharedPreferenceService;

  AuthRepositoryImpl(this._apiClient, this._sharedPreferenceService);

  @override
  Future<void> login(String body) async {
    try {
      await _apiClient.login(body);
      await _sharedPreferenceService.setString(StorageConstants.kUser, body);
    } catch (e) {
      log('[AuthRepositoryImpl][login] $e');
    }
  }
}
