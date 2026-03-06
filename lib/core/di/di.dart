import 'package:coursiq/features/auth/data/repo/auth_repo.dart';
import 'package:coursiq/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton(() => AuthCubit(getIt.get<AuthRepo>()));
}
