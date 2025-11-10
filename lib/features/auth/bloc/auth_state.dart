import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  // only static page
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  // only show login CircularIndicator
  @override
  List<Object?> get props => [];
}

class AuthSuccessState extends AuthState {
  // show data
  final String email;
  AuthSuccessState(this.email);
  @override
  List<Object?> get props => [email];
}

class AuthErrorState extends AuthState {
  // show & handle error
  final String error;

  AuthErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class ObscureButtonState extends AuthState {
  final bool isObscure;

  ObscureButtonState({required this.isObscure});

  @override
  List<Object?> get props => [isObscure];
}

class AuthNavigateToRegisterState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthNavigateToLoginState extends AuthState {
  @override
  List<Object?> get props => [];
}