import 'dart:async';

import 'package:deltainformatics/core/constants/keys.dart';
import 'package:deltainformatics/features/categories/view/selected_category_screen.dart';
import 'package:deltainformatics/features/create_product/bloc/create_product_events.dart';
import 'package:deltainformatics/features/create_product/bloc/create_product_states.dart';
import 'package:deltainformatics/features/home/data/api/home_api.dart';
import 'package:deltainformatics/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../categories/data/api/categories_api.dart';

class CreateProductBloc extends Bloc<CreateProductEvents, CreateProductStates> {
  CreateProductBloc()
      : super(CreateProductStates(
            chooseCategory: [
              'electronics',
              'jewelery',
              'men\s clothing',
              'women\s clothing'
            ],
            status: CreateProductStatus.initial,
            productDesc: TextEditingController(),
            productPrice: TextEditingController(),
            productName: TextEditingController())) {
    on<ClickCreateProduct>(createProduct);
    on<SelectImageFromCamera>(selectImageFromCamera);
    on<SelectImageFromGallery>(selectImageFromGallery);
    on<SelectCategory>(selectCategory);
  }

  Future<FutureOr> createProduct(
    ClickCreateProduct events,
    Emitter<CreateProductStates> emit,
  ) async {
    emit(state.copyWith(
      status: CreateProductStatus.loading,
    ));

    await HomeApi()
        .createProduct(
            events.chosenImage?.path ?? '',
            events.productName ?? '',
            events.productDescription ?? '',
            events.productCategory ?? '',
            events.productPrice ?? '')
        .then((value) {
      print(value);
      if (value != null) {
        ScaffoldMessenger.of(navigatorKey.currentContext!)
            .showSnackBar(SnackBar(
             content: Text('Succefully Created '),
          backgroundColor: Colors.green,
        ));
        // Navigator.pushAndRemoveUntil(
        //     navigatorKey.currentContext!,
        //     MaterialPageRoute(
        //       builder: (context) => HomeScreen(),
        //     ),
        //     (Rout) => false);
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!)
            .showSnackBar(SnackBar(
          content: Text('Something Went Wrong PLease Try Again'),
          backgroundColor: Colors.red,
        ));
        emit(state.copyWith(
          status: CreateProductStatus.error,
        ));
      }
    });
  }

  Future<FutureOr> selectImageFromCamera(
    SelectImageFromCamera events,
    Emitter<CreateProductStates> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    emit(state.copyWith(
        status: CreateProductStatus.success, chooseImage: image));
  }

  Future<FutureOr> selectImageFromGallery(
    SelectImageFromGallery events,
    Emitter<CreateProductStates> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    emit(state.copyWith(
        status: CreateProductStatus.success, chooseImage: image));
  }

  Future<FutureOr> selectCategory(
    SelectCategory events,
    Emitter<CreateProductStates> emit,
  ) async {
    emit(state.copyWith(
        selectedCategory: events.SelectedChoice,
        status: CreateProductStatus.success));
  }
}
