import 'package:equatable/equatable.dart';

import '../../home/data/models/product_model.dart';

enum categoriesStatus { initial, loading, success, error }


class CategoriesState extends Equatable {
  final categoriesStatus status;

  List<String>? categories;
  List<ProductModel>? products;

  CategoriesState({this.status = categoriesStatus.initial, this.categories, this.products});

  CategoriesState copyWith({
    categoriesStatus? status,
    List<String>? categories,
    List<ProductModel>? products,
  }) {
    return CategoriesState(
        status: status ?? this.status,
        categories: categories ?? this.categories,
      products: products??this.products
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, categories];
}


