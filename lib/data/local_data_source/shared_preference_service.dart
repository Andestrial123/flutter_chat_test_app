import 'package:flutter_chat_test_app/config/constants/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SharedPreferenceService {
  String? get username;

  String? getString(String key);

  Future<void> setString(String key, String value);
}

class SharedPreferenceServiceImpl implements SharedPreferenceService {
  final SharedPreferences _sharedPreference;

  SharedPreferenceServiceImpl(this._sharedPreference);

  @override
  String? getString(String key) {
    return _sharedPreference.getString(key);
  }

  @override
  Future<void> setString(String key, String value) async => await _sharedPreference.setString(key, value);

  @override
  String? get username => _sharedPreference.getString(StorageConstants.kUser);
}
