import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deltainformatics/features/categories/bloc/categorie_events.dart';
import 'package:deltainformatics/features/categories/data/api/categories_api.dart';

import 'categorie_states.dart';

class CategoryBloc extends Bloc<CategoriesEvents, CategoriesState> {
  CategoryBloc() : super(CategoriesState(status: categoriesStatus.initial)) {
    on<GetCategories>(eventGetCategories);
    on<SelectCategory>(eventSelectCategory);
  }

  Future<FutureOr> eventGetCategories(
    CategoriesEvents events,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(status: categoriesStatus.loading, categories: []));
   await CategorieApi().getCategories().then((value) {
      emit(state.copyWith(status: categoriesStatus.success, categories:value));
    }).catchError((e){
      emit(state.copyWith(status: categoriesStatus.error, categories:[]));
      throw e;
    });
  }

  Future<FutureOr> eventSelectCategory(
      SelectCategory events,
      Emitter<CategoriesState> emit,
      ) async {
    emit(state.copyWith(status: categoriesStatus.loading,products: []));
    await CategorieApi().selectCategories(events.name).then((value) {
      emit(state.copyWith(status: categoriesStatus.success,products: value));
    }).catchError((e){
      emit(state.copyWith(status: categoriesStatus.error,products: []));
      throw e;
    });
  }
}
