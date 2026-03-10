import 'package:bloc/bloc.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/features/video/data/model/videos_model.dart';
import 'package:coursiq/features/video/data/repo/video_repo.dart';
import 'package:meta/meta.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit({required this.videoRepo}) : super(VideoInitial());

  late VideoRepo videoRepo;

  Future<void> getVideo({required int targetId}) async {
    emit(GetVideoLoading());
    var result = await videoRepo.getVideos(targetId: targetId);
    if (result is ApiSuccess) {
      emit(GetVideoSuccess(videos: result.data));
    } else if (result is ApiFailure) {
      emit(GetVideoError(message: result.message));
    }
  }
}
