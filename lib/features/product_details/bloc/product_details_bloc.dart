import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deltainformatics/features/home/data/models/product_model.dart';
import 'package:deltainformatics/features/home/data/models/rate_model.dart';
import 'package:deltainformatics/features/product_details/bloc/product_details_events.dart';
import 'package:deltainformatics/features/product_details/bloc/product_details_states.dart';

import '../data/product_details_api.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvents, ProductsDetailsStates> {
  ProductDetailsBloc() : super(ProductsDetailsStates()) {
    on<GetProductDetailsEvent>(getProductDetails);
  }

  Future<FutureOr> getProductDetails(
    GetProductDetailsEvent event,
    Emitter<ProductsDetailsStates> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));
    await ProductDetailsApi().getProductById(event.id!).then((value) {
      emit(state.copyWith(status: ProductStatus.success, productModel: value));
    }).catchError((e) {
      emit(state.copyWith(
        status: ProductStatus.error,
      ));
      throw e;
    });
  }
}
