
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/service/data_base_service.dart';
import 'package:fruits_hub/core/service/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/utils/end_points.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';


class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
 final DataBaseService  dataBaseService ;
  AuthRepoImpl( { required this.firebaseAuthService, required this.dataBaseService});



  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userCreated= UserModel.fromFirebaseUser(user);
      await addData( user: userCreated);
      return Right(userCreated);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left( ServerFailure ( e.message));
    }catch(e){
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
       return Left( ServerFailure (AppStrings.somethingWentWrong));
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
       return Left( ServerFailure (AppStrings.somethingWentWrong));
    }
    
  }
   @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final userCredential = await firebaseAuthService.logInWithGoogle();
      return Right(UserModel.fromFirebaseUser(userCredential));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    }
 
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithApple() {
    throw UnimplementedError();
    
  }

  

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await firebaseAuthService.logInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    }
   
  }
  
  @override
  Future addData({required UserEntity user}) async {
    await dataBaseService.addData(
      path: EndPoints.users,
      data: user.toMap(),

    );
  }

 
}
