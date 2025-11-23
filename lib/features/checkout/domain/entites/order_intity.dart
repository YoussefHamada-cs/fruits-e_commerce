import 'package:fruits_hub/features/cart/domain/entites/car_item_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';

class OrderIntity {
 final List<CartItemEntity> cartItems;
  final bool isPeymentCash;
  final ShippingAddressEntity shippingAddress;

  OrderIntity({required this.cartItems, required this.isPeymentCash, required this.shippingAddress});
}
