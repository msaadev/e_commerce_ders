import 'package:dio/dio.dart';
import 'package:e_commerce_example/core/constants/api_constants.dart';

class API {
  static API? _instance;

  late final Dio _dio;
  late final BaseOptions _baseOptions;

  static API get instance {
    _instance ??= API._init();
    return _instance!;
  }

  API._init() {
    _baseOptions = BaseOptions(baseUrl: ApiConstants.BASE_URL);
    _dio = Dio(_baseOptions);
  }

  Future<Response<T>> get<T>({required String endPoint}) async {
    return _dio.get<T>(endPoint);
  }
}
