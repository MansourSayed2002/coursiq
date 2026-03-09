import 'package:bloc/bloc.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/core/helper/local_storage.dart';
import 'package:coursiq/features/my_courses/data/model/mycourse_model.dart';
import 'package:coursiq/features/my_courses/data/repo/mycourses_repo.dart';
import 'package:meta/meta.dart';

part 'mycourses_state.dart';

class MycoursesCubit extends Cubit<MycoursesState> {
  MycoursesCubit(this.mycoursesRepo) : super(MycoursesInitial());

  late MycoursesRepo mycoursesRepo;

  Future<void> getMyCourses() async {
    emit(MycoursesLoading());
    String uuid = await LocalStorageApp.getSecureStorage("id") ?? "";
    var result = await mycoursesRepo.getMyCourse(uuid);
    if (result is ApiSuccess) {
      emit(MycoursesSuccess(myCourse: result.data));
    } else if (result is ApiFailure) {
      emit(MycoursesError(message: result.message));
    }
  }
}
