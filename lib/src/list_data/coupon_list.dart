import '../models/coupon_model.dart';

class CouponList {
  static List<CouponModel> couponList = [
    CouponModel(
      name: 'Gift Card',
      discount: 50,
      expired: DateTime.now(),
      condition: CouponCondition.not_used,
    ),
    CouponModel(
      name: 'Free Shipping',
      discount: 25,
      expired: DateTime.now(),
      condition: CouponCondition.not_used,
    ),
    CouponModel(
      name: 'New Member Coupon',
      discount: 10,
      expired: DateTime.now(),
      condition: CouponCondition.not_used,
    ),
    CouponModel(
      name: 'Special Reward',
      discount: 70,
      expired: DateTime.now(),
      condition: CouponCondition.not_used,
    ),
  ];
  static List<CouponModel> usedList = [
    CouponModel(
      name: 'Free Shipping',
      discount: 25,
      expired: DateTime.now(),
      condition: CouponCondition.used,
    ),
    CouponModel(
      name: 'New Member Coupon',
      discount: 10,
      expired: DateTime.now(),
      condition: CouponCondition.used,
    ),
  ];
  static List<CouponModel> expiredList = [
    CouponModel(
      name: 'Gift Card',
      discount: 50,
      expired: DateTime.now(),
      condition: CouponCondition.exprired,
    ),
    CouponModel(
      name: 'Free Shipping',
      discount: 25,
      expired: DateTime.now(),
      condition: CouponCondition.exprired,
    ),
    CouponModel(
      name: 'New Member Coupon',
      discount: 10,
      expired: DateTime.now(),
      condition: CouponCondition.exprired,
    ),
    CouponModel(
      name: 'Special Reward',
      discount: 70,
      expired: DateTime.now(),
      condition: CouponCondition.exprired,
    ),
  ];
}
