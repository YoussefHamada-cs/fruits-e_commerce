// lib/feature/auth/data/repositories/auth_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/service/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  // final GoogleSignIn _googleSignIn;

  AuthRepoImpl({ required this.firebaseAuthService});



  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left( ServerFailure ( e.message));
    }catch(e){
       return Left( ServerFailure ('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }

  }
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left( ServerFailure ( e.message));
    }catch(e){
       return Left( ServerFailure ('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
    
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithApple() {
    throw UnimplementedError();
    
  }

  

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}
