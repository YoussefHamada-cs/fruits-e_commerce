

import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/models/review_model.dart';


class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
 
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final int sellingCount;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviewsModel;
  ProductModel({
    this.imageUrl,
    required this.name,
    required this.sellingCount, 
    required this.code,
    required this.description,
    required this.price,
   
    required this.isFeatured,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviewsModel,
  });
 
 factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    imageUrl: json['imageUrl'],
    name: json['name'],
    code: json['code'],
    description: json['description'],
    price: json['price'],
    
    isFeatured: json['isFeatured'],
    expirationsMonths: json['expirationsMonths'],
    isOrganic: json['isOrganic'],
    numberOfCalories: json['numberOfCalories'],
    unitAmount: json['unitAmount'],
    reviewsModel: (json['reviewsModel'] as List<dynamic>)
        .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList(), sellingCount: json['sellingCoun'],
  );
}
 ProductEntity toEntity() {
    return ProductEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        reviewsModel: reviewsModel.map((e) => e.toEntity()).toList(),
        expirationsMonths: expirationsMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        isFeatured: isFeatured,
        imageUrl: imageUrl,
    );
  }
  toJson() => {
    'name': name,
    'code': code,
    'description': description,
    'price': price,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'expirationsMonths': expirationsMonths,
    'isOrganic': isOrganic,
    'numberOfCalories': numberOfCalories,
    'unitAmount': unitAmount,
    'reviewsModel': reviewsModel.map((e) => e.toJson()).toList(),
  };
}
