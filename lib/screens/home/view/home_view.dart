import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_example/core/widgets/cards/user_card.dart';
import 'package:e_commerce_example/screens/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _homeViewModel;

  @override
  void initState() {
    _homeViewModel = HomeViewModel(context);
    _homeViewModel.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(_homeViewModel.myString);
        }),
        centerTitle: true,
      ),
      
      body: Observer(builder: (_) {
        var userList = _homeViewModel.userList;
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            var item = userList[index];
            return UserCard(item: item, index: index);
          },
        );
      }),
    );
  }

}
