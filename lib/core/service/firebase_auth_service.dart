import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomException( AppStrings.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          AppStrings.emailAlreadyInUse,
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException( AppStrings.networkRequestFailed);
      } else if (e.code == 'invalid-email') {
        throw CustomException( AppStrings.emailInvalid);
      } else {
        throw CustomException(
          AppStrings.somethingWentWrong,
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
         AppStrings.somethingWentWrong,
      );
    }
  }
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.loginWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException( AppStrings.userNotFound);
      } else if (e.code == 'wrong-password') {
        throw CustomException( AppStrings.wrongPassword);
      } else if (e.code == 'network-request-failed') {
        throw CustomException( AppStrings.networkRequestFailed);
      } else if (e.code == 'invalid-email') {
        throw CustomException( AppStrings.emailInvalid);
      } else {
        throw CustomException(
         AppStrings.somethingWentWrong ,
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.loginWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
         AppStrings.somethingWentWrong ,
      );
    }
  }
}
