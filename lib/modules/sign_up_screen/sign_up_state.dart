part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class PasswordVisibilityChanged extends SignUpState {
  final bool isVisible;
  PasswordVisibilityChanged(this.isVisible);
}

class ConfirmPasswordVisibilityChanged extends SignUpState {
  final bool isVisible;
  ConfirmPasswordVisibilityChanged(this.isVisible);
}

class GenderChanged extends SignUpState {
  final bool isMale;
  final bool isFemale;
  GenderChanged({required this.isMale, required this.isFemale});
}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}
