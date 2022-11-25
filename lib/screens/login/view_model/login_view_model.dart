import 'package:e_commerce_example/core/models/products_model.dart';
import 'package:e_commerce_example/core/network/services/product_service.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  ObservableList<ProductModel> products = ObservableList();

  @action
  Future getProducts() async {
    var result = await ProductService().getProducts();

    if (result != null) {
      products.clear();
      products.addAll(result);
    }
  }
}
