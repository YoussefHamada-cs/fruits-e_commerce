import 'dart:convert';

import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String userBoxName = 'userBox';

  

  UserEntity? getUser() {
    final userBox = Hive.box(userBoxName);
    final jsonString = userBox.get('user');
    if (jsonString == null) return null;
 

    final userEntity = UserModel.fromJson(jsonDecode(jsonString));
    return userEntity;
  }

  
}
