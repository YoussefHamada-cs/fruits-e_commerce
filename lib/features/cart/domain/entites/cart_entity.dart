import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/entites/car_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
 removeCarItem(CartItemEntity carItem) {
    cartItems.remove(carItem);
  }

  bool isExis(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getcartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, quanitty: 1);
  }
}
