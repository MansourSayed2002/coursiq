import 'dart:developer';
import 'package:coursiq/core/enum/status_request.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/core/network/supabase.dart';
import 'package:coursiq/features/my_courses/data/model/mycourse_model.dart';

class MycoursesRepo {
  Future<ApiResult> getMyCourse(String targetID) async {
    try {
      List result = await AppSupabase.supabase.client.rpc(
        "get_my_courses",
        params: {"user_id": targetID},
      );
      log(result.toString());
      return ApiSuccess(
        data: result.map((e) => MycourseModel.fromJson(e)).toList(),
        statusRequest: StatusRequest.success,
      );
    } catch (e) {
      return ApiFailure(
        statusRequest: StatusRequest.failure,
        message: e.toString(),
      );
    }
  }
}
