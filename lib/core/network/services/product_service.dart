import 'package:e_commerce_example/core/models/products_model.dart';
import 'package:e_commerce_example/core/network/api.dart';

class ProductService {
  late final API api;

  ProductService() {
    api = API.instance;
  }

  Future<List<ProductModel>?> getProducts() async {
    var result = await api.get<Map>(endPoint: 'products');
    var data = result.data;
    if (data != null && data['result'] != null && data['result'] is List) {
      List<ProductModel> productList = [];
      (data['result'] as List).forEach((element) {
        var model = ProductModel.fromJson(element);
        productList.add(model);
      });
      return productList;
    } else {
      return null;
    }
  }
}
