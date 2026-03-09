part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<CategoriesModel> categories;
  HomeSuccess({required this.categories});
}

final class HomeErrors extends HomeState {
  final String message;
  HomeErrors({required this.message});
}

final class HomeLoading extends HomeState {}

final class HomeCoursesLoading extends HomeState {}

final class HomeCoursesSuccess extends HomeState {
  final List<RecommendedCoursesModel> courses;
  HomeCoursesSuccess({required this.courses});
}

final class HomeCoursesError extends HomeState {
  final String message;
  HomeCoursesError({required this.message});
}

final class HomeBannerLoading extends HomeState {}

final class HomeBannerSuccess extends HomeState {
  final List<BannerModel> banner;
  HomeBannerSuccess({required this.banner});
}

final class HomeBannerError extends HomeState {
  final String message;
  HomeBannerError({required this.message});
}
