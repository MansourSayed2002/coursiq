
import 'package:coursiq/core/enum/status_request.dart';

class ApiResult {}

class ApiSuccess<T> extends ApiResult {
  final T data;
  ApiSuccess({required this.data, required StatusRequest statusRequest});
}

class ApiFailure extends ApiResult {
  final StatusRequest statusRequest;
  final String message;
  ApiFailure({required this.statusRequest, required this.message});
}
