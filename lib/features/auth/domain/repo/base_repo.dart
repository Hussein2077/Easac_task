import 'package:dartz/dartz.dart';
import 'package:easac_task/core/error/failure.dart';
import 'package:easac_task/features/auth/domain/use_case/login_google_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseRepository {
  Future<Either<dynamic, Failure>> signInWithGoogle();
  Future<Either<UserCredential, Failure>> signInWithFacebook();
}
