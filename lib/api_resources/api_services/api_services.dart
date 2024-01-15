// import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

import '../../core/core.dart';
import '../../resources/app_data.dart';

class ApiServices {
  static const imageUrl = 'https://asos2.p.rapidapi.com';
  static const baseurl = 'https://asos2.p.rapidapi.com/products';
  static const rapidApiKey =
      "5cc739eff9mshf0f0b6760ad82bcp11d58ajsn1e8ced302527";
  static const rapidApiHost = "asos2.p.rapidapi.com";
  final Dio dio = Dio();

  ApiServices() {
    dio.options.headers = headers;
  }

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        // 'Authorization': '',
        "X-RapidAPI-Key": rapidApiKey,
        "X-RapidAPI-Host": rapidApiHost,
      };
  static const Map<String, String> headerss = {
    "X-RapidAPI-Key": rapidApiKey,
    "X-RapidAPI-Host": rapidApiHost,
  };
  String get _token => 'Bearer ${AppData.instance.token ?? ''}';

  /// This function uses [path] parameter which is the API path after base URL.
  /// The [baseUrl] parameter is optional; by default, it will use the value set in this class.
  /// If you want to pass a custom base URL, feel free to pass it.
  /// The [body] parameter is Map<String, String>; if there are no body fields, don't pass this parameter.
  Future<Response> post(String path, Map<String, String> body,
      {String baseUrl = baseurl}) async {
    dio.options.headers['Authorization'] = _token; // Set authorization header
    final response = await dio.post(baseUrl + path, data: body);
    console('SERVICES :: RESPONSE BODY : ${response.data}');
    console('SERVICES :: STATUS CODE : ${response.statusCode}');
    return response;
  }

  /// This function uses [path] parameter which is the API path after base URL.
  /// The [baseUrl] parameter is optional; by default, it will use the value set in this class.
  /// If you want to pass a custom base URL, feel free to pass it.
  Future<Response> get(String path, {String baseUrl = baseurl}) async {
    dio.options.headers['Authorization'] = _token; // Set authorization header
    final response = await dio.get(baseUrl + path);
    console('SERVICES :: RESPONSE BODY : ${response.data}');
    console('SERVICES :: STATUS CODE : ${response.statusCode}');
    return response;
  }
}
