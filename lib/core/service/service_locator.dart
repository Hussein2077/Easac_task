import 'package:easac_task/features/auth/data/auth_remote_data_source.dart';
import 'package:easac_task/features/auth/data/repo_imp.dart';
import 'package:easac_task/features/auth/domain/repo/base_repo.dart';
import 'package:easac_task/features/auth/domain/use_case/login_facebook_use_case.dart';
import 'package:easac_task/features/auth/domain/use_case/login_google_use_case.dart';
import 'package:easac_task/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc

    getIt.registerLazySingleton(() => LoginWithPlatformBloc(
        signInWithGoogleUseCase: getIt(), signInWithFacebookUseCase: getIt()));

//use_case
    getIt.registerFactory(
        () => SignInWithGoogleUseCase(baseRepository: getIt()));
    getIt.registerFactory(
        () => SignInWithFacebookUseCase(baseRepository: getIt()));
    //remote data
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    // repo
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
  }
}
