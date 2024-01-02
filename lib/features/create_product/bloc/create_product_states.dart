import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

enum CreateProductStatus { initial, loading, success, error }

class CreateProductStates extends Equatable {
  CreateProductStatus? status;
  TextEditingController productName = TextEditingController();
  TextEditingController productDesc = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  List<String>? chooseCategory = [
    'electronics',
    'jewelery',
    'men\s clothing',
    'women\s clothing'
  ];
  String? selectedCategory = '';
  XFile? chooseImage;

  CreateProductStates({
    this.status = CreateProductStatus.initial,
    required this.productDesc,
    required this.productPrice,
    required this.productName,
    this.chooseCategory,
    this.chooseImage,
    this.selectedCategory,
  });

  CreateProductStates copyWith({
    CreateProductStatus? status,
    TextEditingController? productDesc,
    TextEditingController? productPrice,
    TextEditingController? productName,
    List<String>? chooseCategory,
    XFile? chooseImage,
    String? selectedCategory,
  }) {
    return CreateProductStates(
        status: status ?? this.status,
        chooseImage: chooseImage ?? this.chooseImage,
        chooseCategory: chooseCategory ?? this.chooseCategory,
        productDesc: productDesc ?? this.productDesc,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        selectedCategory: selectedCategory ?? this.selectedCategory);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        productDesc,
        productPrice,
        productName,
        status,
        chooseCategory,
        chooseImage,
        selectedCategory
      ];
}
