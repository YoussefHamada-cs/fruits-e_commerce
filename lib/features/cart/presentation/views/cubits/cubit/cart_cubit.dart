import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart/domain/entites/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  void addCartItem(CartEntity cartEntity) {
    emit(CartAdded());
  }
}
