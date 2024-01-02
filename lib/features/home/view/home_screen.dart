import 'package:deltainformatics/features/home/bloc/home_bloc.dart';
import 'package:deltainformatics/features/home/bloc/home_events.dart';
import 'package:deltainformatics/features/home/bloc/home_states.dart';
import 'package:deltainformatics/features/product_details/view/product_model_screen.dart';
import 'package:deltainformatics/widget/products_view.dart';
import 'package:deltainformatics/widget/text_field_prime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/keys.dart';
import '../../../widget/cashed_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeBloc = context.read<HomeBloc>();
    homeBloc.add(GetProductsHome());

    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return buildView(state, homeBloc);
        });
  }

  Widget buildView(HomeState state, HomeBloc homeBloc) {
    if (state.status == HomeStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == HomeStatus.success) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home Screen',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFieldPrime(
                    controller: state.search,
                    hintText: 'search',
                    onChange: (value) {
                      print(value);
                      homeBloc.add(SearchProductHome(value));
                    },
                    iconData: Icons.search),
              ),
              Expanded(
                  child: ProductsGridView(
                products: state.searchProducts ?? [],
              ))
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
