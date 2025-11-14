import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/helper/get_avg_rating.dart';
import 'package:fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final String? imageUrl;
  final int expirationsMonths;
  final int sellingCount;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final List<ReviewModel> reviewsModel;
  final num avgRating;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.expirationsMonths,
    required this.sellingCount,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviewsModel,
    required this.avgRating,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviews = (json['reviewsModel'] as List<dynamic>? ?? [])
        .map((e) => ReviewModel.fromJson(e))
        .toList();

    return ProductModel(
      name: json['name'],
      code: json['code'] ,
      description: json['description'] ,
      price: json['price'] ,
      isFeatured: json['isFeatured'] ,
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      sellingCount: json['sellingCount'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviewsModel: reviews,
      avgRating: getAvgRating(reviews),
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      imageUrl: imageUrl,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isFeatured: isFeatured,
      reviewsModel: reviewsModel.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'sellingCount': sellingCount,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviewsModel': reviewsModel.map((e) => e.toJson()).toList(),
    };
  }
}
