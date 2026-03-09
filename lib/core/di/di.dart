import 'package:coursiq/features/auth/data/repo/auth_repo.dart';
import 'package:coursiq/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coursiq/features/details/data/repo/details_repo.dart';
import 'package:coursiq/features/details/presentation/cubit/details_cubit.dart';
import 'package:coursiq/features/home/data/repo/home_repo.dart';
import 'package:coursiq/features/home/presentation/cubit/home_cubit.dart';
import 'package:coursiq/features/my_courses/data/repo/mycourses_repo.dart';
import 'package:coursiq/features/my_courses/presentation/cubit/mycourses_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());
  getIt.registerLazySingleton<DetailsRepo>(() => DetailsRepo());
  getIt.registerLazySingleton<MycoursesRepo>(() => MycoursesRepo());

  getIt.registerLazySingleton(() => AuthCubit(getIt.get<AuthRepo>()));
  getIt.registerLazySingleton(() => HomeCubit(getIt.get<HomeRepo>()));
  getIt.registerLazySingleton(() => DetailsCubit(getIt.get<DetailsRepo>()));
  getIt.registerLazySingleton(() => MycoursesCubit(getIt.get<MycoursesRepo>()));
}
