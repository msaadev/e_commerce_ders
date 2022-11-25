import 'package:e_commerce_example/core/network/api.dart';
import 'package:e_commerce_example/screens/login/view/login_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final API api;
  late final TextEditingController itemTextController;

  @override
  void initState() {
    // build methodu cagrilmadan calisir
    print('inited');

    api = API.instance;
    itemTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // sayfa terk edilirken cagrilir
    itemTextController.dispose();
    print('Disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Home View'),)
    );
  }



}
