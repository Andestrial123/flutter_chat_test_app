part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

final class LoginSendEvent extends LoginEvent{
  final String username;

  LoginSendEvent(this.username);
}
