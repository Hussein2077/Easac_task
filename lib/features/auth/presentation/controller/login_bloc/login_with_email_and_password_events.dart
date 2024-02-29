import 'package:equatable/equatable.dart';

abstract class BaseSignInWithPlatformEvent extends Equatable {
  const BaseSignInWithPlatformEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends BaseSignInWithPlatformEvent {
  const SignInWithGoogleEvent();
}class SignInWithFacebookEvent extends BaseSignInWithPlatformEvent {
  const SignInWithFacebookEvent();
}
