import 'package:treshop/src/models/cart_model.dart';

class CartList {
  static List<CartModel> cartList = [
    CartModel(
      color: 2,
      orderId: 22322,
      price: 450,
      productImage: 'https://i.ibb.co/hcZTBsW/image-14.png',
      productName: 'Morrissey print T-shirt',
      qty: 2,
      size: 1,
    ),
    CartModel(
      color: 4,
      orderId: 3434,
      price: 335,
      productImage: 'https://i.ibb.co/ch18FbT/image-19.png',
      productName: 'Valentino embroidered VLogo bucket hat',
      qty: 1,
      size: 0,
    ),
    CartModel(
      color: 3,
      orderId: 34330,
      price: 543,
      productImage: 'https://i.ibb.co/6yLT20W/image-10.png',
      productName: 'Maison Margiela distressed-knit layered jumper',
      qty: 1,
      size: 1,
    ),
  ];
}
