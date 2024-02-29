import 'package:equatable/equatable.dart';

abstract class LoginWithPlatformState extends Equatable {
  const LoginWithPlatformState();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleInitial extends LoginWithPlatformState {}

class SignInWithGoogleLoadingState extends LoginWithPlatformState {
  const SignInWithGoogleLoadingState();
}

class SignInWithGoogleErrorMessageState extends LoginWithPlatformState {
  final String errorMessage;

  const SignInWithGoogleErrorMessageState({required this.errorMessage});
}

class SignInWithGoogleSuccessMessageState extends LoginWithPlatformState {
  final String successMessage;

  const SignInWithGoogleSuccessMessageState({required this.successMessage});
}
class SignInWithFacebookLoadingState extends LoginWithPlatformState {
  const SignInWithFacebookLoadingState();
}

class SignInWithFacebookErrorMessageState extends LoginWithPlatformState {
  final String errorMessage;

  const SignInWithFacebookErrorMessageState({required this.errorMessage});
}

class SignInWithFacebookSuccessMessageState extends LoginWithPlatformState {
  final String successMessage;

  const SignInWithFacebookSuccessMessageState({required this.successMessage});
}
