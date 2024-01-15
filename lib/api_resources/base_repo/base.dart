import 'package:ecommerceapp/api_resources/api_services/api_services.dart';
import 'package:ecommerceapp/di/di.dart';

class Base {
  final ApiServices _apiServices = getIt.get<ApiServices>();
  ApiServices get apiServices => _apiServices;
}
