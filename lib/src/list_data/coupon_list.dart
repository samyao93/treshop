import '../models/coupon_model.dart';

class CouponList {
  static List<CouponModel> couponList = [
    CouponModel(
      name: 'Gift Card',
      discount: 50,
      expired: DateTime.now(),
    ),
    CouponModel(
      name: 'Free Shipping',
      discount: 25,
      expired: DateTime.now(),
    ),
    CouponModel(
      name: 'New Member Coupon',
      discount: 10,
      expired: DateTime.now(),
    ),
    CouponModel(
      name: 'Special Reward',
      discount: 70,
      expired: DateTime.now(),
    ),
  ];
}
