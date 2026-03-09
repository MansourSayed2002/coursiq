import 'package:coursiq/features/auth/data/repo/auth_repo.dart';
import 'package:coursiq/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coursiq/features/home/data/repo/home_repo.dart';
import 'package:coursiq/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());

  getIt.registerLazySingleton(() => AuthCubit(getIt.get<AuthRepo>()));
  getIt.registerLazySingleton(() => HomeCubit(getIt.get<HomeRepo>()));
}
