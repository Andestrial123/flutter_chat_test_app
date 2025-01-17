import 'package:auto_route/auto_route.dart';
import 'package:flutter_chat_test_app/config/router/app_router.gr.dart';
import 'package:flutter_chat_test_app/config/router/guards/auth_guard.dart';
import 'package:flutter_chat_test_app/config/router/routes.dart';

@AutoRouterConfig(replaceInRouteName: "View|Page|Screen")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginPageRoute.page,
          path: Routes.login,
          initial: true,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: ChatPageRoute.page,
          path: Routes.chat,
        ),
      ];
}
