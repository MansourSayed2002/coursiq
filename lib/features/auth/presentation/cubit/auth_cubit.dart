import 'package:bloc/bloc.dart';
import 'package:coursiq/core/handle_errors/api_result.dart';
import 'package:coursiq/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  late AuthRepo authRepo;

  Future<void> createAccount({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.signUp(
      email: email,
      password: password,
      fullName: fullName,
    );
    if (result is ApiSuccess) {
      emit(AuthSuccess());
    } else if (result is ApiFailure) {
      emit(AuthErrors(message: result.message));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.logIn(email: email, password: password);
    if (result is ApiSuccess) {
      emit(AuthSuccess());
    } else if (result is ApiFailure) {
      emit(AuthErrors(message: result.message));
    }
  }
}
