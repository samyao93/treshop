
enum CouponCondition {notUsed, used, exprired}

class CouponModel {
  final String? name;
  final int? discount;
  final DateTime? expired;
  final CouponCondition? condition;

  CouponModel({this.name, this.discount, this.expired,this.condition});
}
