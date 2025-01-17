// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter_chat_test_app/features/chat/chat_page.dart'
    as _i1;
import 'package:flutter_chat_test_app/features/login/login_page.dart'
    as _i2;

/// generated route for
/// [_i1.ChatPage]
class ChatPageRoute extends _i3.PageRouteInfo<void> {
  const ChatPageRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ChatPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChatPage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i3.PageRouteInfo<void> {
  const LoginPageRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}
