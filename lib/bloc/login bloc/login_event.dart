part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginButtonPress extends LoginEvent{
  final String phone;
  final String password;
  LoginButtonPress({required this.phone, required this.password});
}

class SaveLoginStatus extends LoginEvent{
  final bool isLoggedIn;
  SaveLoginStatus({required this.isLoggedIn});
}

class CheckLoginStatus extends LoginEvent{
  final User user;
  CheckLoginStatus({required this.user});
}