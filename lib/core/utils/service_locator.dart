import 'package:bookly_ebook_app/core/utils/api_service.dart';
import 'package:bookly_ebook_app/features/home/data/data_sources/home_local_data_source_implementation.dart';
import 'package:bookly_ebook_app/features/home/data/data_sources/home_remote_data_source_implementation.dart';
import 'package:bookly_ebook_app/features/search/data/data_sources/search_local_data_source_implementation.dart';
import 'package:bookly_ebook_app/features/search/data/data_sources/search_remote_data_source_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo_implementation.dart';
import '../../features/search/data/repos/search_repo_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      homeLocalDataSource: HomeLocalDataSourceImplementation(),
      homeRemoteDataSource: HomeRemoteDataSourceImplementation(
        getIt.get<ApiService>(),
        ),
      ),
  );

  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(
        searchRemoteDataSource: SearchRemoteDataSourceImplementation(
          getIt.get<ApiService>(),
        ),
        searchLocalDataSource: SearchLocalDataSourceImplementation()
    ),
  );
}
