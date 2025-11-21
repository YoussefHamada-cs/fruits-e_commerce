import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/entites/car_item_entity.dart';
import 'package:fruits_hub/features/cart/domain/entites/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartEntity cartEntity = CartEntity([]);
  CartCubit() : super(CartInitial());
  void addProductItem(ProductEntity productEntity) {
    bool isProductExis = cartEntity.isExis(productEntity);
    var cartItem = cartEntity.getcartItem(productEntity);
    if (isProductExis) {
      cartItem.increasQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(CartAdded());
  }
  
  void deleteCarItem(CartItemEntity carItem) {
    cartEntity.removeCarItem(carItem);
    emit(CartRemoved());
  }
}
