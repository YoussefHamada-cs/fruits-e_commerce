import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/service/data_base_service.dart';

class FireStoreService implements DataBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data}) async {
    await _firestore.collection(path).add(data);
  }

}   