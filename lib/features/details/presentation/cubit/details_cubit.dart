import 'package:bloc/bloc.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/features/details/data/model/input_subscription.dart';
import 'package:coursiq/features/details/data/model/moduls_model.dart';
import 'package:coursiq/features/details/data/model/video_model.dart';
import 'package:coursiq/features/details/data/repo/details_repo.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitial());
  late DetailsRepo detailsRepo;

  Future<void> getmoduls(int targetId) async {
    emit(DetailsLoading());
    var result = await detailsRepo.getDetailscourses(targetId);
    if (result is ApiSuccess) {
      emit(DetailsSuccess(moduls: result.data));
    } else if (result is ApiFailure) {
      emit(DetailsError(message: result.message));
    }
  }

  Future<void> getvideo(int targetId) async {
    emit(DetailsVideoLoading());
    var result = await detailsRepo.getVideoCourse(targetId);
    if (result is ApiSuccess) {
      emit(DetailsVideoSuccess(video: result.data));
    } else if (result is ApiFailure) {
      emit(DetailsVideoError(message: result.message));
    }
  }

  Future<void> subscription(InputSubscription input) async {
    emit(SubscriptionLoading());
    var result = await detailsRepo.subscriptionCourse(input);
    if (result is ApiSuccess) {
      emit(SubscriptionSuccess());
    } else if (result is ApiFailure) {
      emit(SubscriptionError(message: result.message));
    }
  }
}
