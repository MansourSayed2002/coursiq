import 'package:bloc/bloc.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/features/home/data/model/banner_model.dart';
import 'package:coursiq/features/home/data/model/categories_model.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:coursiq/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  late HomeRepo homeRepo;

  Future<void> getCategories() async {
    emit(HomeLoading());
    var result = await homeRepo.getCategories();
    if (result is ApiSuccess) {
      emit(HomeSuccess(categories: result.data));
    } else if (result is ApiFailure) {
      emit(HomeErrors(message: result.message));
    }
  }

  Future<void> getRecommendedCourses() async {
    emit(HomeCoursesLoading());
    var result = await homeRepo.getRecommendedCourses();
    if (result is ApiSuccess) {
      emit(HomeCoursesSuccess(courses: result.data));
    } else if (result is ApiFailure) {
      emit(HomeCoursesError(message: result.message));
    }
  }

  Future<void> getBanner() async {
    emit(HomeBannerLoading());
    var result = await homeRepo.getBanner();
    if (result is ApiSuccess) {
      emit(HomeBannerSuccess(banner: result.data));
    } else if (result is ApiFailure) {
      emit(HomeBannerError(message: result.message));
    }
  }
}
