import 'package:e_commerce_example/core/network/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final BuildContext myContext;
  late final UserService _userService;

  _HomeViewModelBase(this.myContext) {
    print('object');
    _userService = UserService();
  }

  @observable
  String myString = 'Users';

  @action
  void setMyString() {
    myString = 'dasdasdas';
  }

  @observable
  ObservableList userList = ObservableList();

  @action
  Future getUsers() async {
    var response = await _userService.getUsers();
    if (response != null) {
      userList.addAll(response);
    }
  }

  @action
  Future getAUser(int user) async {
    _userService.getUser(userIndex: user);
  }
}
