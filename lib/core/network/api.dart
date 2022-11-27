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

  Future<Response<T>> get<T>(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    var result = await _dio.get<T>(endPoint, queryParameters: queryParameters);
    print('Result = ${result.data}');
    return result;
  }
}
