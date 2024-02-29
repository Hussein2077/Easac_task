import 'package:easac_task/core/base_use_case/base_use_case.dart';
import 'package:easac_task/features/auth/domain/use_case/login_facebook_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easac_task/core/resource_manager/string_manager.dart';
import 'package:easac_task/core/utils/api_helper.dart';
import 'package:easac_task/features/auth/domain/use_case/login_google_use_case.dart';
import 'package:easac_task/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:easac_task/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';

class LoginWithPlatformBloc
    extends Bloc<BaseSignInWithPlatformEvent, LoginWithPlatformState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignInWithFacebookUseCase signInWithFacebookUseCase;

  LoginWithPlatformBloc({
    required this.signInWithGoogleUseCase,
    required this.signInWithFacebookUseCase,
  }) : super(SignInWithGoogleInitial()) {
    on<SignInWithGoogleEvent>((event, emit) async {
      emit(const SignInWithGoogleLoadingState());
      final result = await signInWithGoogleUseCase.call(const NoParameter());
      result.fold(
          (l) => emit(const SignInWithGoogleSuccessMessageState(
              successMessage: StringManager.loginSuccessfully)),
          (r) => emit(SignInWithGoogleErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    on<SignInWithFacebookEvent>((event, emit) async {
      emit(const SignInWithFacebookLoadingState());
      final result = await signInWithFacebookUseCase.call(const NoParameter());
      result.fold(
          (l) => emit(const SignInWithFacebookSuccessMessageState(
              successMessage: StringManager.loginSuccessfully)),
          (r) => emit(SignInWithFacebookErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
