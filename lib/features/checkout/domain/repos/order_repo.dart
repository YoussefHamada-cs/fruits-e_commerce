import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';


abstract class OrderRepo {
 Future<Either<Failure,OrderEntity>> createOrder(OrderEntity order); 
}