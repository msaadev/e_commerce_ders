import 'package:e_commerce_example/core/network/services/product_service.dart';
import 'package:e_commerce_example/screens/home/view/home_view.dart';
import 'package:e_commerce_example/screens/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/network/api.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final API api;
  late final TextEditingController _passwordController;
  late final LoginViewModel _viewModel;

  @override
  void initState() {
    api = API.instance;
    _passwordController = TextEditingController();
    _viewModel = LoginViewModel();
    _viewModel.getProducts();

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ProductService().getProducts();
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => const HomeView()));
        },
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _viewModel.products.length,
          itemBuilder: (context, index) {
            var item = _viewModel.products[index];
            return Text(item.productName ?? 'null');
          },
        );
      }),
    );
  }
}
