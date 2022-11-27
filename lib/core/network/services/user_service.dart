import 'package:e_commerce_example/core/network/api.dart';

class UserService {
  late final API api;

  UserService() {
    api = API.instance;
  }

  Future getUser({required int userIndex}) async {
    var response = await api.get(endPoint: 'users/$userIndex');
  }

  Future<List?> getUsers({int? page}) async {
    var response = await api.get(
        endPoint: 'users',
        queryParameters: page != null ? {'page': page} : null);
    var data = response.data;
    if (data != null && data['data'] != null && data['data'] is List) {
      var list = data['data'] as List;
      return list;
    }
    return null;
  }
}
