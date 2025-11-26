import 'package:fruits_hub/features/cart/domain/entites/cart_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final String uid;
  bool? isPaymentCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.cartEntity,
    this.isPaymentCash,
    required this.shippingAddress,
    required this.uid,
  });
}
