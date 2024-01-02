import 'package:deltainformatics/core/network/api_helper.dart';

import '../../../home/data/models/product_model.dart';


class CategorieApi{
  ApiHelper helper = ApiHelper();

  Future<List<String>> getCategories() async {
    try{
      List<String> categories=[];
      var resp = await helper.get('products/categories',{});
      for(var json in resp ){
        categories.add(json);
      }
      return categories;
    }
    catch(e){
      rethrow ;
    }
  }

  Future<List<ProductModel>> selectCategories(name) async {
    try{
      List<ProductModel>product =[];
      var resp = await helper.get('products/category/$name',{});
      for (var json in resp) {
        product.add(ProductModel.fromJson(json));
      }
      return product;
    }
    catch(e){
      rethrow ;
    }
  }
}