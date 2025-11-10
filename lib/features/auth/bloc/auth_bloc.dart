import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool _isObscure = true;

  AuthBloc() : super(AuthInitialState()) {
    //loginSubmit event

    on<LoginSubmitEvent>(_handleLoginSubmitEvent);

    on<NavigateToRegisterEvent>(_navigateToRegisterScreen);
    on<NavigateToLoginEvent>(_navigateToLoginScreen);
    on<ObscureButtonEvent>(_onObscureButtonState);
  }

  Future<void> _handleLoginSubmitEvent(
    LoginSubmitEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await Future.delayed(
      const Duration(seconds: 1),
    ); // Add a delay of 2 seconds

    final isValidInput = _isValidInput(event.email, event.password);

    if (isValidInput) {
      emit(AuthSuccessState(event.email));
    } else {
      emit(AuthErrorState('Invalid input'));
    }
  }

  bool _isValidInput(String email, String password) =>
      email == 'user' && password == 'user';

  void _onObscureButtonState(event, emit) {
    _isObscure = !_isObscure;
    emit(ObscureButtonState(isObscure: _isObscure));
  }

  Future<void> _navigateToRegisterScreen(
    NavigateToRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(AuthNavigateToRegisterState());
  }

  Future<void> _navigateToLoginScreen(
    NavigateToLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(AuthNavigateToLoginState());
  }
}
