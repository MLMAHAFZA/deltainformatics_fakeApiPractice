import 'package:deltainformatics/features/product_details/bloc/product_details_bloc.dart';
import 'package:deltainformatics/features/product_details/bloc/product_details_events.dart';
import 'package:deltainformatics/features/product_details/bloc/product_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/cashed_image.dart';

class ProductModelScreen extends StatelessWidget {
  const ProductModelScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var blocProduct = context.read<ProductDetailsBloc>();
    blocProduct.add(GetProductDetailsEvent(id: id));
    return BlocBuilder<ProductDetailsBloc, ProductsDetailsStates>(
        bloc: blocProduct, builder: (context, state) => buildUi(state));
  }

  Widget buildUi(ProductsDetailsStates state) {
    switch (state.status) {
      case ProductStatus.loading:
        return Scaffold(
          body: Center(
              child: CircularProgressIndicator(
            color: Colors.cyan,
            backgroundColor: Colors.white,
          )),
        );
      case ProductStatus.success:
        return Scaffold(
          appBar: AppBar(
            title: Text('Product Details'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: CashedImage(img: state.productModel?.image ?? '')),
                  SizedBox(height: 16,),
                  Column(
                    children: [
                     Text('${state.productModel?.title??''}'),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Icon(Icons.star,color: Colors.amber,),
                         Text('${state.productModel?.rating?.rate}'),
                       ],
                     ),

                   ],
                  ),
                  SizedBox(height: 16,),
                  Text('${state.productModel?.description??''}',
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                 ),),
                  SizedBox(height: 16,),
                  Text('Price:${state.productModel?.price??0}\$',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 23
                  ),),
                ],
              ),
            ),
          ),
        );
      case ProductStatus.error:
        return SizedBox();

      default:
        return SizedBox();
    }
  }
}
