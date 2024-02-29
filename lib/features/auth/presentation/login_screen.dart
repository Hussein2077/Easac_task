import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easac_task/core/resource_manager/asset_path.dart';
import 'package:easac_task/core/resource_manager/colors.dart';
import 'package:easac_task/core/resource_manager/routes.dart';
import 'package:easac_task/core/resource_manager/string_manager.dart';
import 'package:easac_task/core/utils/app_size.dart';
import 'package:easac_task/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:easac_task/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:easac_task/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';
import 'package:easac_task/features/auth/presentation/widgets/auth_button.dart';
import 'package:easac_task/features/auth/presentation/widgets/social_auth_row.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {




  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return BlocConsumer<LoginWithPlatformBloc, LoginWithPlatformState>(
      listener: (context, state) {
        if (state is SignInWithGoogleSuccessMessageState) {
          EasyLoading.dismiss();
          Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
        }
        else if (state is SignInWithGoogleErrorMessageState) {
          EasyLoading.dismiss();
          SnackBar snackBar = SnackBar(
            content: Text(state.errorMessage.toString()),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar,
          );
        }
        else if (state is SignInWithGoogleLoadingState) {
          EasyLoading.show(status: 'loading...');
        }
        else if (state is SignInWithFacebookSuccessMessageState) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
        }
        else if (state is SignInWithFacebookErrorMessageState) {
          log('${state.errorMessage}ssssss');
          SnackBar snackBar = SnackBar(
            content: Text(state.errorMessage.toString()),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar,
          );
        }
        else if (state is SignInWithFacebookLoadingState) {
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: AppSize.screenWidth! * .4,
                      child: Text(
                        StringManager.welcomeBack.tr(),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: AppSize.defaultSize! * 2,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColor),
                      )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(delay: 300.ms, duration: 800.ms),
                    ),
                    SizedBox(
                      height: AppSize.defaultSize! * 7,
                    ),
                    AuthButton(
                        onTap: () {
                          BlocProvider.of<LoginWithPlatformBloc>(context)
                              .add(const SignInWithGoogleEvent());
                        },
                        widget: SocialAuthRow(
                          icon: Image.asset(
                            AssetPath.google,
                            scale: 15,
                          ),
                          text: StringManager.google,
                          textColor: AppColors.blackColor,
                        ),
                        color: AppColors.whiteColor),
                    SizedBox(
                      height: AppSize.defaultSize! * 2.7,
                    ),
                    AuthButton(
                      onTap: (){
                        BlocProvider.of<LoginWithPlatformBloc>(context)
                            .add(const SignInWithFacebookEvent());
                      },
                        widget: SocialAuthRow(
                          icon: Image.asset(
                            AssetPath.facebook,
                            scale: 15,
                          ),
                          text: StringManager.facebook,
                          textColor: AppColors.whiteColor,
                        ),
                        color: AppColors.facebookColor),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
