import 'package:get_it/get_it.dart';

import '../api_resources/api_repos_abstract/home_repo.dart';
import '../api_resources/api_repos_imp/home_repo_imp.dart';
import '../api_resources/api_services/api_services.dart';

GetIt getIt = GetIt.instance;

class DI {
  static Future<void> initDI() async {
    getIt.registerLazySingleton<ApiServices>(() => ApiServices());
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImp());

    // getIt.registerSingleton<HomeRepo>(HomeRepoImp());
    await getIt.allReady();
  }
}
