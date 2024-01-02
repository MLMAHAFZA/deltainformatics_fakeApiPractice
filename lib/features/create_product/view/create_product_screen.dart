import 'dart:io';

import 'package:deltainformatics/app/theme.dart';
import 'package:deltainformatics/features/create_product/bloc/create_product_bloc.dart';
import 'package:deltainformatics/features/create_product/bloc/create_product_events.dart';
import 'package:deltainformatics/features/create_product/bloc/create_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/keys.dart';
import '../../../widget/text_field_prime.dart';

class CreateProductScreen extends StatelessWidget {
  CreateProductScreen({super.key});



  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<CreateProductBloc>();
    return BlocBuilder<CreateProductBloc, CreateProductStates>(
      bloc: bloc,
      builder: (context, state) {
        return createProductUi(context, bloc, state);
      },
    );
  }

  Widget buildUiCreateProductImage(
      CreateProductStates state, CreateProductBloc createProductBloc) {
    if (state.chooseImage != null) {
      return Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: FileImage(File(state.chooseImage!.path))),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[400],
        ),
        width: double.infinity,
        height: 180,
        child: Center(
          child: Container(
            width: 90,
            height: 90,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check, size: 50, color: Colors.white),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primary,
        ),
        width: double.infinity,
        height: 180,
        child:Lottie.asset('assets/lottie/camera_lottie_icon.json',),
      );
    }
  }

  Widget createProductUi(
      context, CreateProductBloc bloc, CreateProductStates state) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  _showImagePickerBottomSheet(context, bloc);
                },
                child: buildUiCreateProductImage(state, bloc),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldPrime(
                hintText: 'Product Name',
                controller: state.productName!,
                iconData: Icons.text_fields,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldPrime(
                maxlines: 4,
                hintText: 'Product Description',
                controller: state.productDesc!,
                iconData: Icons.text_fields,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(
                    'Selected Choice: ${state.selectedCategory ?? "None"}',
                    style: TextStyle(fontSize: 18),
                  ),
                  value: state.selectedCategory,
                  onChanged: (String? Value) {
                    bloc.add(SelectCategory(SelectedChoice: Value));
                  },
                  items: state.chooseCategory
                          ?.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList() ??
                      [],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldPrime(
                keyboardType: TextInputType.number,
                hintText: 'Product Price',
                controller: state.productPrice!,
                iconData: Icons.attach_money_outlined,
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    bloc.add(ClickCreateProduct(
                        productName: state.productName.text.toString(),
                        productPrice: state.productPrice.text.toString(),
                        chosenImage: state.chooseImage,
                        productCategory: state.chooseCategory.toString(),
                        productDescription: state.productDesc.text.toString()));
                  }else{
                    ScaffoldMessenger.of(navigatorKey.currentContext!)
                        .showSnackBar(SnackBar(
                      content: Text('Something Went Wrong PLease Try Again'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primary,
                  ),
                  child: Center(
                    child: Text(
                      'Create',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImagePickerBottomSheet(
      BuildContext context, CreateProductBloc bloc) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Take a photo'),
              onTap: () {
                bloc.add(SelectImageFromCamera());
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Choose from gallery'),
              onTap: () {
                bloc.add(SelectImageFromGallery());
              },
            ),
          ],
        );
      },
    );
  }
}
