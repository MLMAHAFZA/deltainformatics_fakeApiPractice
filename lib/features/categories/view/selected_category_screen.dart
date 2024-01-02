import 'package:deltainformatics/features/categories/bloc/categorie_bloc.dart';
import 'package:deltainformatics/features/categories/bloc/categorie_events.dart';
import 'package:deltainformatics/features/categories/bloc/categorie_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/cashed_image.dart';
import '../../../widget/products_view.dart';

class SelectedCategory extends StatelessWidget {
  final String ?title;

  const SelectedCategory({super.key,  this.title});


  @override
  Widget build(BuildContext context) {

    var categoryBloc = context.read<CategoryBloc>();

    return BlocBuilder<CategoryBloc, CategoriesState>(
        builder: (context, state) {
          return SelectedCategoryUi(state, categoryBloc);
          });

  }

  Widget SelectedCategoryUi(CategoriesState state, CategoryBloc categoryBloc) {
    if (state.status == categoriesStatus.loading) {
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }

    if (state.status == categoriesStatus.success) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('${title} '),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ProductsGridView(
                    products: state.products ?? [],
                  ))
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
