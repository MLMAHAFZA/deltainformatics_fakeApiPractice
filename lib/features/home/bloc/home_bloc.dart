import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../home/bloc/home_events.dart';
import '../../home/bloc/home_states.dart';
import '../../home/data/api/home_api.dart';
import '../../home/data/models/product_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc() : super( HomeState(search: TextEditingController())) {
    on<GetProductsHome>(eventGetProduct);
    on<SearchProductHome>(searchProduct);
  }

  Future<FutureOr> eventGetProduct(
    HomeEvents events,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        status: HomeStatus.loading, products: [], searchProducts: []));

    await HomeApi().getAllProducts().then((value) {
      emit(state.copyWith(
          status: HomeStatus.success, products: value, searchProducts: value));
    }).catchError((e) {
      debugPrint("========CATCH ERROR THROW EXCEPTIONS====================");
      debugPrint(e.toString());
      debugPrint("========CATCH ERROR THROW EXCEPTIONS====================");
      emit(state.copyWith(status: HomeStatus.error, products: []));
    });
  }

  Future<FutureOr> searchProduct(
    SearchProductHome events,
    Emitter<HomeState> emit,
  ) async {
    List<ProductModel> searchResult = [];

    var result = state.products?.where((element) => element.title
        .toString()
        .toLowerCase()
        .contains(events.txt.toString().toLowerCase()));

    for (var item in result!) {
      searchResult.add(item);
    }

    emit(state.copyWith(
        status: HomeStatus.success, searchProducts: searchResult));
  }
}
