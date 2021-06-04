import 'package:treshop/src/models/cart_model.dart';
import 'package:treshop/src/models/order_model.dart';

class OrderList {
  static List<OrderModel> orderList = [
    OrderModel(
      status: OrderStatus.packaging,
      dateOrder: DateTime.now(),
      total: 590,
      products: [
        CartModel(
          productName: "Morrissey print T-shirt",
          price: 590,
          color: 2,
          qty: 1,
          size: 1,
          productImage:
              'https://cdn-images.farfetch-contents.com/14/11/00/53/14110053_18777042_1000.jpg',
        ),
      ],
    ),
    OrderModel(
      status: OrderStatus.on_delivery,
      dateOrder: DateTime.now(),
      total: 766,
      products: [
        CartModel(
          productName: "Givenchy 4G-plaque jacket",
          price: 423,
          color: 3,
          qty: 1,
          size: 2,
          productImage:
              'https://cdn-images.farfetch-contents.com/16/83/86/77/16838677_33425995_1000.jpg',
        ),
        CartModel(
          productName: "Fendi logo-patch backpack",
          price: 343,
          color: 3,
          qty: 1,
          size: 1,
          productImage:
              'https://cdn-images.farfetch-contents.com/16/77/49/90/16774990_33168887_1000.jpg',
        ),
      ],
    ),
    OrderModel(
      status: OrderStatus.success,
      dateOrder: DateTime.now(),
      total: 124,
      products: [
        CartModel(
          productName: "TOM FORD Jago low-top sneakers",
          price: 124,
          color: 4,
          qty: 1,
          size: 2,
          productImage:
              'https://cdn-images.farfetch-contents.com/16/84/52/47/16845247_33438761_1000.jpg',
        ),
      ],
    ),
  ];
}
