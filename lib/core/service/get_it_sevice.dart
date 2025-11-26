import 'package:fruits_hub/core/repos/product_repo.dart';
import 'package:fruits_hub/core/repos/product_repo_impl.dart';
import 'package:fruits_hub/core/service/data_base_service.dart';
import 'package:fruits_hub/core/service/fire_store_service.dart';
import 'package:fruits_hub/core/service/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/checkout/data/repos/order_repo_impl.dart';
import 'package:fruits_hub/features/checkout/domain/repos/order_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
    getIt.registerSingleton<FirebaseAuthService>(
      FirebaseAuthService()
  );
    getIt.registerSingleton<DataBaseService>(
      FireStoreService()
  );
   getIt.registerSingleton<ProductRepo>(
      ProductRepoImpl(dataBaseService:getIt<DataBaseService>() ),
  );
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(), dataBaseService: getIt<DataBaseService>()
  ));
getIt.registerSingleton<OrderRepo>(OrderRepoImpl(
  dataBaseService: getIt<DataBaseService>()
));

}