import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easac_task/core/utils/api_helper.dart';
import 'package:easac_task/core/utils/constant_api.dart';
import 'package:easac_task/core/utils/methods.dart';
import 'package:easac_task/features/auth/domain/use_case/login_google_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseRemotelyDataSource {
  Future<dynamic> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();

}
class AuthRemotelyDateSource extends BaseRemotelyDataSource{
  @override
  Future<dynamic> signInWithGoogle() async {


    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "signInWithGoogle");
    }
  }

  @override
  Future<UserCredential> signInWithFacebook()async {
     try{

         final LoginResult result = await FacebookAuth.instance.login(permissions: (['email', 'public_profile']));
         final token = result.accessToken!.token;
         log('Facebook token userID : ${result.accessToken!.token}');
           final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
           final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);

      return userCredential;
     }
     on DioException catch (e) {
       throw DioHelper.handleDioError(
           dioError: e, endpointName: "signInWithFacebook");
     }

  }

}