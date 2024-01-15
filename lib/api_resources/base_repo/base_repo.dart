import '../../di/di.dart';
import '../api_repos_abstract/home_repo.dart';

mixin BaseRepo {
  final HomeRepo _homeRepo = getIt.get<HomeRepo>();
  HomeRepo get homeRepo => _homeRepo;
}
