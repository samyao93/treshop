import 'package:treshop/src/models/cart_model.dart';

class CartList {
  static List<CartModel> cartList = [
    CartModel(
      color: 2,
      orderId: 22322,
      price: 450,
      productName: 'Morrissey print T-shirt',
      productImage: 'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/PNG%20Files%2Fimage%2015.png?alt=media&token=b1e51f79-798f-4427-9450-66aa13de5f5c',
      qty: 2,
      size: 1,
    ),
    CartModel(
      color: 4,
      orderId: 3434,
      price: 335,
      productName: 'Valentino embroidered VLogo bucket hat',
      productImage: 'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/PNG%20Files%2Fimage%2019.png?alt=media&token=b4076900-30fa-43cd-9c2e-58ebdb43b515',
      qty: 1,
      size: 0,
    ),
    CartModel(
      color: 3,
      orderId: 34330,
      price: 543,
      productName: 'Maison Margiela distressed-knit layered jumper',
      productImage: 'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/PNG%20Files%2Fimage%2017.png?alt=media&token=f233322f-3746-4ab1-a223-f08d7622aadd',
      qty: 1,
      size: 1,
    ),
  ];
}
