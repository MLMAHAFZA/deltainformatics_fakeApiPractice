import 'package:image_picker/image_picker.dart';

abstract class CreateProductEvents{}

class ClickCreateProduct extends CreateProductEvents{
  final XFile ? chosenImage;
  final String ? productName;
  final String ? productDescription;
  final String ? productCategory;
  final String ? productPrice;

  ClickCreateProduct(
      {this.chosenImage,
      this.productName,
      this.productDescription,
      this.productCategory,
      this.productPrice});
}

class SelectImageFromCamera extends CreateProductEvents{
  final XFile ? selectedCameraImage;

  SelectImageFromCamera(
      {
    this .selectedCameraImage,
});

}

class SelectImageFromGallery extends CreateProductEvents{
  final XFile ? selectedGalleryImage;

  SelectImageFromGallery(
      {
        this .selectedGalleryImage,
      });

}

class SelectCategory extends CreateProductEvents{
  final String ? SelectedChoice;


  SelectCategory({
    this.SelectedChoice,
});



}