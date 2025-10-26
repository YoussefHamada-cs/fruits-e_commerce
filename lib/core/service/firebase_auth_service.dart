import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

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
        throw CustomException( 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException( 'تاكد من اتصالك بالانترنت.');
      }else if(
        e.code =='network-request-failed'
      ){
        throw CustomException( 'تاكد من اتصالك بالانترنت.');
      }
      else if (e.code == 'invalid-email') {
        throw CustomException( 'البريد الالكتروني غير صالح.');
      } else {
        throw CustomException(
          'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
         'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
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
        throw CustomException( 'لم يتم العثور على مستخدم بهذا البريد الالكتروني.');
      } else if (e.code == 'wrong-password') {
        throw CustomException( 'او كلمه المرور البريد الالكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException( 'تاكد من اتصالك بالانترنت.');
      } else if (e.code == 'invalid-email') {
        throw CustomException( 'او كلمه المرور البريد الالكتروني غير صالح.');
      } else {
        throw CustomException(
          'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.loginWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
         'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }
}
