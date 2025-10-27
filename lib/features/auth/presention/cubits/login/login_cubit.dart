import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepo.loginWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(
       LoginFailure(message: failure.message!),
      ),
      (userEntity) => emit(
        LoginSuccess(user: userEntity),
      ),
    );
  }
  Future<void> loginWithGoogle() async {

    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(
       LoginFailure(message: failure.message!),
      ),
      (userEntity) => emit(
        LoginSuccess(user: userEntity),
      ),
    );
  }
  Future<void> loginWithFacebook() async {

    emit(LoginLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(
       LoginFailure(message: failure.message!),
      ),
      (userEntity) => emit(
        LoginSuccess(user: userEntity),
      ),
    );
  }
}
