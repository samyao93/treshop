import 'dart:ui';

class ProductModel {
  final String? name;
  final String? description;
  final double? rating;
  final int? totalReview;
  final int? price;
  final List<String>? images;
  final List<String>? itemSize;
  final List<Color>? itemColor;
  final int discount;

  ProductModel({
    this.name,
    this.description,
    this.rating,
    this.totalReview,
    this.images,
    this.price,
    this.itemSize,
    this.itemColor,
    this.discount = 0,
  });
}
