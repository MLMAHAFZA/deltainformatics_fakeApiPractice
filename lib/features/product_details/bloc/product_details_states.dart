import 'package:deltainformatics/features/home/data/models/product_model.dart';

enum ProductStatus { loading, initial, success, error }

class ProductsDetailsStates {
  final ProductModel? productModel;
  final ProductStatus? status;

  ProductsDetailsStates(
      { this.productModel, this.status = ProductStatus.initial});

  ProductsDetailsStates copyWith(
      {ProductModel? productModel, ProductStatus? status}) {
    return ProductsDetailsStates(
        productModel: productModel ?? this.productModel,
        status: status ?? this.status);
  }
}
