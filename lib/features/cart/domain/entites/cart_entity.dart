import 'package:fruits_hub/features/cart/domain/entites/car_item_entity.dart';

class CartEntity {
   final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
}