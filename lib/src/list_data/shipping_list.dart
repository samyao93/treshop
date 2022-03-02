 
import 'package:treshop/src/models/shipping_model.dart';

class ShippingList {
  static List<ShippingModel> shippingList = [
    ShippingModel(
      name: 'Express Shipping',
      estimate: '2-3',
      price: 5,
    ),
    ShippingModel(
      name: 'Reguler Shipping',
      estimate: '3-6',
      price: 3,
    ),
    ShippingModel(
      name: 'FedEx Shipping',
      estimate: '2-3',
      price: 8,
    ),
  ];
}
