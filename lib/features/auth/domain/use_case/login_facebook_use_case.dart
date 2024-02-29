import 'package:dartz/dartz.dart';
import 'package:easac_task/core/base_use_case/base_use_case.dart';
import 'package:easac_task/core/error/failure.dart';
import 'package:easac_task/features/auth/domain/repo/base_repo.dart';

class SignInWithFacebookUseCase extends BaseUseCase< dynamic,NoParameter>{

  BaseRepository baseRepository ;


  SignInWithFacebookUseCase({ required this.baseRepository});

  @override
  Future<Either< dynamic, Failure>> call(NoParameter parameter) async {
    final result = await baseRepository.signInWithFacebook();

    return result ;
  }


}