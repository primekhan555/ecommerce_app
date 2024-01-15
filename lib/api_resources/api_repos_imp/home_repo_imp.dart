import 'dart:convert';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:ecommerceapp/api_resources/api_models/products_model.dart';
// import 'package:http/http.dart';

import '../../constants/app_api_paths.dart';
import '../../core/app_print.dart';
import '../../core/boxes/data_boxes.dart';
import '../api_repos_abstract/home_repo.dart';
import '../api_services/api_response.dart';
import '../api_services/handling_response.dart';

class HomeRepoImp extends HomeRepo {
  @override
  Future<ApiResponse> getProducts({bool allowLocalSaveAndGet = false}) async {
    try {
      Response res = await apiServices.get(AppApiPaths.products);
      ApiResponse result = HandlingResponse.returnResponse(res);
      console('REPO : ${result.status}');
      if (result.status == Status.completed) {
        ProductsModel data = await Isolate.run(
            () => ProductsModel.fromJson(res.data));
        if (allowLocalSaveAndGet) {
          DataBoxes.ins.setData(AppApiPaths.products, json.encode(res.data));
        }
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      console(w);
      ApiResponse response = HandlingResponse.returnException(w,
          localDataKey: AppApiPaths.products,
          loadOfflineData: allowLocalSaveAndGet);
      if (response.status == Status.completed) {
        ProductsModel data = await Isolate.run(
            () => ProductsModel.fromJson(json.decode(response.data)));
        return ApiResponse.completed(data);
      } else {
        return response;
      }
    }
  }
}
