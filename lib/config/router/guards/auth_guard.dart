import 'package:auto_route/auto_route.dart';
import 'package:flutter_chat_test_app/config/router/app_router.gr.dart';
import 'package:flutter_chat_test_app/data/local_data_source/shared_preference_service.dart';
import 'package:flutter_chat_test_app/di.dart';

class AuthGuard extends AutoRouteGuard {
  final SharedPreferenceService _sharedPreferenceService = getIt();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_sharedPreferenceService.username != null) {
      resolver.redirect(const ChatPageRoute());
    } else {
      resolver.next(true);
    }
  }
}
