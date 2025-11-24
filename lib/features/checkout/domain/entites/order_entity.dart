import 'package:fruits_hub/features/cart/domain/entites/cart_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? isPaymentCash;
  final ShippingAddressEntity? shippingAddress;

  OrderEntity({
    required this.cartEntity,
    this.isPaymentCash,
    this.shippingAddress,
  });
}
