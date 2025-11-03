import 'dart:convert';

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
import 'package:hive_flutter/hive_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });


  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        uid: user.uid,
        email: user.email!,
        name: name,
      );
      var ischeakExist= await dataBaseService.checkIsUserExists(path: EndPoints.users, documentId: userEntity.uid);
      if(ischeakExist){
        await getUserData(uId: userEntity.uid);
      }else{
        await addData(user: userEntity);
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
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
     var userEntity = await getUserData(uId: user.uid);
     saveUserData(user: userEntity);
     var ischeakExist= await dataBaseService.checkIsUserExists(path: EndPoints.users, documentId: userEntity.uid);
      if(ischeakExist){
        await getUserData(uId: userEntity.uid);
      }else{
        await addData(user: userEntity);
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.logInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var ischeakExist= await dataBaseService.checkIsUserExists(path: EndPoints.users, documentId: userEntity.uid);
      if(ischeakExist){
        await getUserData(uId: userEntity.uid);
      }else{
        await addData(user: userEntity);
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.logInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var ischeakExist= await dataBaseService.checkIsUserExists(path: EndPoints.users, documentId: userEntity.uid);
      if(ischeakExist){
        await getUserData(uId: userEntity.uid);
      }else{
        await addData(user: userEntity);
      }
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    }
  }

  @override
  Future addData({required UserEntity user}) async {
    await dataBaseService.addData(path: EndPoints.users, data: UserModel.fromEntity(user).toMap(), documentId: user.uid);
  }
  
  @override
  Future<UserEntity> getUserData({required String uId}) async {
   var userData = await dataBaseService.getData(path: EndPoints.users, documentId: uId);
    return UserModel.fromJson(userData);
  }
  
  @override
  Future saveUserData({required UserEntity user}) {
    var json=jsonEncode(  UserModel.fromEntity(user).toMap());
    return saveUserDataHive(user:json);
  }
  

}
final userBox = Hive.box('userBox');

Future<void> saveUserDataHive({required String user}) async {
  await userBox.put('user', user);
}