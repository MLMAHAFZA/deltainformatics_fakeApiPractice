import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/product_model.dart';

enum HomeStatus { loading, initial, success, error }


class HomeState extends Equatable {

  final HomeStatus? status;
  final List<ProductModel>? products;
  final List<ProductModel>? searchProducts;
  TextEditingController  search = TextEditingController();

  HomeState({this.status = HomeStatus.initial, required this.search , this.products,this.searchProducts, });

  HomeState copyWith({
    HomeStatus? status,
    TextEditingController? search,
    List<ProductModel>? products,
    List<ProductModel>? searchProducts,
  }) {
    return HomeState(search: search??this.search, status: status??this.status, products: products??this.products,searchProducts:searchProducts ??this.searchProducts);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, search, products,searchProducts];
}
