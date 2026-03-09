import 'dart:developer';

import 'package:coursiq/core/constants/database_table.dart';
import 'package:coursiq/core/enum/status_request.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/core/network/supabase.dart';
import 'package:coursiq/features/home/data/model/banner_model.dart';
import 'package:coursiq/features/home/data/model/categories_model.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:flutter/material.dart';

class HomeRepo {
  Future<ApiResult> getCategories() async {
    try {
      var result = await AppSupabase.supabase.client
          .from(DatabaseTable.categories)
          .select();
      log(Icons.palette.codePoint.toString());
      log(Icons.code.codePoint.toString());
      return ApiSuccess(
        data: result.map((e) => CategoriesModel.fromJson(e)).toList(),
        statusRequest: StatusRequest.success,
      );
    } catch (e) {
      log(e.toString());
      return ApiFailure(
        message: e.toString(),
        statusRequest: StatusRequest.failure,
      );
    }
  }

  Future<ApiResult> getRecommendedCourses() async {
    try {
      List result = await AppSupabase.supabase.client.rpc(
        "recommended_courses",
      );
      if (result.isEmpty) {
        return ApiFailure(
          message: "No recommended courses",
          statusRequest: StatusRequest.failure,
        );
      }
      return ApiSuccess(
        data: result.map((e) => RecommendedCoursesModel.fromJson(e)).toList(),
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

  Future<ApiResult> getBanner() async {
    try {
      List result = await AppSupabase.supabase.client
          .from(DatabaseTable.banner)
          .select();
      log(result.toString());
      if (result.isEmpty) {
        return ApiFailure(
          message: "No Banner",
          statusRequest: StatusRequest.failure,
        );
      }
      return ApiSuccess(
        data: result.map((e) => BannerModel.fromJson(e)).toList(),
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
