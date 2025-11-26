
import 'package:fruits_hub/core/service/data_base_service.dart';
import 'package:fruits_hub/core/utils/end_points.dart';
import 'package:fruits_hub/features/checkout/data/repos/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/repos/order_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
    final DataBaseService dataBaseService;
  OrderRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, OrderEntity>> createOrder(OrderEntity order) async{
   try {
     await dataBaseService.addData(path: EndPoints.orders, data: OrderModel.fromEntity(order).toJson(), documentId: order.uid);
     return Right(order);
   } catch (e) {
     return Left(ServerFailure(e.toString()));
   }
   
  }
}