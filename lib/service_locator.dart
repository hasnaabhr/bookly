import 'package:bookly/models/book_model/repos/home_repo_implementation.dart';
import 'package:bookly/models/book_model/search_repo/search_repo_implementation.dart';
import 'package:bookly/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(
      getIt.get<ApiServices>(),
    ),
  );
}
