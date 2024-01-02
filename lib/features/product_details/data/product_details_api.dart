import 'package:deltainformatics/core/network/api_helper.dart';

import '../../home/data/models/product_model.dart';

class ProductDetailsApi {
  ApiHelper helper = ApiHelper();

  Future<ProductModel> getProductById(
    int id,
  ) async {
    try {
      ProductModel productModel;

      var response = await helper.get('products/${id.toString()}', {});
      productModel = ProductModel.fromJson(response);
      return productModel;
    } catch (e) {
      rethrow;
    }
  }
}
