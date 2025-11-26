
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/repos/order_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrderRepo orderRepo;
  OrdersCubit({required this.orderRepo}) : super(OrdersInitial());

  Future<void> createOrder(OrderEntity order) async {
    emit(OrdersLoading());
    final result = await orderRepo.createOrder(order);
    result.fold(
      (failure) => emit(OrdersFailure(message: failure.message)),
      (order) => emit(OrdersSuccess()),
    );
  }
}
