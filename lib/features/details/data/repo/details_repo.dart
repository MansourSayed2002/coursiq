import 'dart:developer';

import 'package:coursiq/core/constants/database_table.dart';
import 'package:coursiq/core/enum/status_request.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/core/network/supabase.dart';
import 'package:coursiq/features/details/data/model/moduls_model.dart';
import 'package:coursiq/features/details/data/model/video_model.dart';

class DetailsRepo {
  Future<ApiResult> getDetailscourses(int targetId) async {
    try {
      List result = await AppSupabase.supabase.client
          .from(DatabaseTable.moduls)
          .select()
          .eq("id_course", targetId);
      if (result.isEmpty) {
        return ApiFailure(
          message: "No data",
          statusRequest: StatusRequest.failure,
        );
      }
      return ApiSuccess(
        data: result.map((e) => ModulsModel.fromJson(e)).toList(),
        statusRequest: StatusRequest.success,
      );
    } catch (e) {
      log(e.toString());
      return ApiFailure(
        statusRequest: StatusRequest.failure,
        message: e.toString(),
      );
    }
  }

  Future<ApiResult> getVideoCourse(int targetId) async {
    try {
      List result = await AppSupabase.supabase.client
          .from(DatabaseTable.videoCourse)
          .select()
          .eq("modul_id", targetId);
      if (result.isEmpty) {
        return ApiFailure(
          message: "No data",
          statusRequest: StatusRequest.failure,
        );
      }
      return ApiSuccess(
        data: result.map((e) => VideoModel.fromJson(e)).toList(),
        statusRequest: StatusRequest.success,
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
