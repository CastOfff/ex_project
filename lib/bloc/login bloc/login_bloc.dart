import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/local_storage/user_preferences.dart';
import '../../data/model/user.dart';
import '../../data/repository/user_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService userService;
  final UserPreferences userPreferences;
  LoginBloc({required this.userService, required this.userPreferences})
      : super(LoginInitial()) {
    on<LoginButtonPress>(_onLoginButtonPressed);
    on<SaveLoginStatus>(_onSaveLoginStatus);
    on<CheckLoginStatus>(_checkLoginStatus);
  }
  Future<void> _checkLoginStatus(
      CheckLoginStatus event, Emitter<LoginState> emit) async {
    bool isLoggedIn = await userPreferences.getLoginStatus();
    if (isLoggedIn) {
      emit(LoginSuccess(user: event.user));
    }
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPress event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      User? user = await userService.getUsersFormSever(
        phone: event.phone ?? '',
        password: event.password ?? '',
      );
      if (user != null) {
        await userPreferences.saveUser(user);
        await userPreferences.saveLoginStatus(true);
        emit(LoginSuccess(user: user));
      } else {
        emit(LoginFailure(error: 'Login failed'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> _onSaveLoginStatus(
      SaveLoginStatus event, Emitter<LoginState> emit) async {
    await userPreferences.saveLoginStatus(event.isLoggedIn);
  }
}
