import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class LoginSubmitEvent extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class ObscureButtonEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToRegisterEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToLoginEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}