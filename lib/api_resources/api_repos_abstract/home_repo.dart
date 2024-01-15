import 'package:ecommerceapp/api_resources/base_repo/base.dart';

import '../api_services/api_response.dart';

abstract class HomeRepo extends Base {
  Future<ApiResponse> getProducts({bool allowLocalSaveAndGet = false});
}
