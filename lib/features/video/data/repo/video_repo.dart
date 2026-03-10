import 'dart:developer';
import 'package:coursiq/core/enum/status_request.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/core/helper/local_storage.dart';
import 'package:coursiq/core/network/supabase.dart';
import 'package:coursiq/features/video/data/model/videos_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VideoRepo {
  Future<ApiResult> getVideos({required int targetId}) async {
    try {
      String userId = await LocalStorageApp.getSecureStorage("id") ?? "";
      List result = await AppSupabase.supabase.client.rpc(
        "get_course_videos",
        params: {"p_course_id": targetId, "p_user_id": userId},
      );
      return ApiSuccess(
        data: result.map((e) => VideosCourseModel.fromJson(e)).toList(),
        statusRequest: StatusRequest.success,
      );
    } on PostgrestException catch (e) {
      return ApiFailure(
        statusRequest: StatusRequest.failure,
        message: e.message.toString(),
      );
    } catch (e) {
      log(e.toString());
      return ApiFailure(
        statusRequest: StatusRequest.failure,
        message: e.toString(),
      );
    }
  }
}
