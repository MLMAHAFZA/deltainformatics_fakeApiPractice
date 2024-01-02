import 'package:deltainformatics/app/theme.dart';
import 'package:deltainformatics/features/categories/bloc/categorie_bloc.dart';
import 'package:deltainformatics/features/categories/bloc/categorie_events.dart';
import 'package:deltainformatics/features/categories/bloc/categorie_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/keys.dart';
import 'selected_category_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryBloc = context.read<CategoryBloc>();
    categoryBloc.add(GetCategories());

    return BlocBuilder<CategoryBloc, CategoriesState>(
      builder: (context, state) => categoriesUi(state, categoryBloc),
    );
  }

  Widget categoriesUi(CategoriesState state, CategoryBloc categoryBloc) {
    switch (state.status) {
      case categoriesStatus.loading:
        return Center(child: const CircularProgressIndicator());
      case categoriesStatus.success:
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: state.categories?.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 170,
                child: GestureDetector(
                  onTap: () {
                    categoryBloc.add(
                        SelectCategory(name: state.categories?[index] ?? ''));
                    Navigator.push(
                      navigatorKey.currentContext!,
                      MaterialPageRoute(
                        builder: (context) => SelectedCategory(title: state.categories?[index] ?? '',),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      '${state.categories?[index]}',
                      style: TextStyle(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ),
        );
      case categoriesStatus.error:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
