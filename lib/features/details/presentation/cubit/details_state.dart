part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final List<ModulsModel> moduls;
  DetailsSuccess({required this.moduls});
}

final class DetailsError extends DetailsState {
  final String message;
  DetailsError({required this.message});
}

final class DetailsVideoLoading extends DetailsState {}

final class DetailsVideoSuccess extends DetailsState {
  final List<VideoModel> video;
  DetailsVideoSuccess({required this.video});
}

final class DetailsVideoError extends DetailsState {
  final String message;
  DetailsVideoError({required this.message});
}
