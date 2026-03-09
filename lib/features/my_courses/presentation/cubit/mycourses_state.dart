part of 'mycourses_cubit.dart';

@immutable
sealed class MycoursesState {}

final class MycoursesInitial extends MycoursesState {}

final class MycoursesLoading extends MycoursesState {}

final class MycoursesSuccess extends MycoursesState {
  final List<MycourseModel> myCourse;
  MycoursesSuccess({required this.myCourse});
}

final class MycoursesError extends MycoursesState {
  final String message;
  MycoursesError({required this.message});
}
