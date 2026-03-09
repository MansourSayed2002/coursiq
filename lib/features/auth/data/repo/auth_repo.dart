import 'dart:developer';
import 'package:coursiq/core/constants/database_table.dart';
import 'package:coursiq/core/enum/status_request.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/core/helper/local_storage.dart';
import 'package:coursiq/core/network/supabase.dart';
import 'package:coursiq/features/auth/data/model/input_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  Future<ApiResult> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final result = await AppSupabase.supabase.client.auth.signUp(
        email: email,
        password: password,
        data: {"fullname": fullName},
      );
      if (result.user != null) {
        await saveDataUser(
          InputUserModel(
            email: email,
            fullName: fullName,
            id: result.user?.id.toString(),
          ),
        );
      }
      return ApiSuccess(data: "Success", statusRequest: StatusRequest.success);
    } on AuthApiException catch (e) {
      if (e.message.contains("User already registered")) {
        log(' User already registered');
        return ApiFailure(
          statusRequest: StatusRequest.userAlreadyRegistered,
          message: "User already registered",
        );
      } else {
        log(e.message.toString());
        return ApiFailure(
          statusRequest: StatusRequest.failure,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(
        statusRequest: StatusRequest.failure,
        message: e.toString(),
      );
    }
  }

  Future<void> saveDataUser(InputUserModel input) async {
    try {
      await AppSupabase.supabase.client
          .from(DatabaseTable.users)
          .insert(input.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<ApiResult> logIn({
    required String email,
    required String password,
  }) async {
    try {
      var result = await AppSupabase.supabase.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      log(result.user.toString());
      LocalStorageApp.setSecureStorage("id", result.user?.id.toString() ?? "");
      LocalStorageApp.saveData("name", result.user?.userMetadata?['fullname']);
      return ApiSuccess(data: "Success", statusRequest: StatusRequest.success);
    } on AuthApiException catch (e) {
      log(e.message.toString());
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
