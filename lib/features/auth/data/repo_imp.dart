import 'package:dartz/dartz.dart';
import 'package:easac_task/core/error/failure.dart';
import 'package:easac_task/core/utils/api_helper.dart';
import 'package:easac_task/features/auth/data/auth_remote_data_source.dart';
import 'package:easac_task/features/auth/domain/repo/base_repo.dart';
import 'package:easac_task/features/auth/domain/use_case/login_google_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RepositoryImp extends BaseRepository {
  final BaseRemotelyDataSource baseRemotelyDataSource;

  RepositoryImp({required this.baseRemotelyDataSource});

  @override
  Future<Either< dynamic, Failure>> signInWithGoogle() async {
    try {
      final result =
          await baseRemotelyDataSource.signInWithGoogle();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }@override
  Future<Either< UserCredential, Failure>> signInWithFacebook() async {
    try {
      final result =
          await baseRemotelyDataSource.signInWithFacebook();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
