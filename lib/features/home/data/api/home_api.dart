import 'package:deltainformatics/core/network/api_helper.dart';
import 'package:deltainformatics/features/home/data/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeApi {
  ApiHelper helper = ApiHelper();

  Future<List<ProductModel>> getAllProducts() async {
    try {
      List<ProductModel> products = [];
      var res = await helper.get('products', {});
      for (var json in res) {
        products.add(ProductModel.fromJson(json));
      }
      return products;
    } catch (e) {
      rethrow;
    }
  }
  
  //---------------------------------------------

  Future  createProduct(
      String image,
      String name,
      String description,
      String category,
      String price
      )async{
  try{
    var resp = await helper.post('products', {}, {
      'title': name,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return resp;

    
  }catch(e){
    rethrow;
  }  
  }
  
  
  
  
}
