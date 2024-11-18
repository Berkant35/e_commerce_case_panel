import 'package:ECommercePanel/features/category/data/datasources/api_datasource/category_remote_datasource.dart';
import 'package:ECommercePanel/features/category/domain/repositories/category_repository.dart';
import 'package:ECommercePanel/features/category/domain/usecases/add_category.dart';
import 'package:get_it/get_it.dart';

import 'core/api_helper/api_connector.dart';
import 'core/locale_helper/hive_connector.dart';
import 'features/category/data/datasources/api_datasource/category_remote_datasource_imp.dart';
import 'features/category/data/repositories/category_repositories_imp.dart';
import 'features/category/domain/usecases/get_categories.dart';

GetIt injector = GetIt.instance;

reset() {
  injector.reset();
}

void initializeDependencies() {
  // ApiConnector lazy
  injector.registerLazySingleton<ApiConnector>(() => ApiConnector());

  // Hive Connector lazy
  injector.registerLazySingleton<HiveConnector>(
      () => HiveConnector("e_commerce_panel"));

  // Api
  injector.registerLazySingleton<CategoryRemoteDatasource>(
      () => CategoryRemoteDatasourceImp(apiConnector: injector()));

  //Repositories
  injector
      .registerLazySingleton<CategoryRepository>(() => CategoryRepositoriesImp(
            categoryRemoteDatasource: injector(),
          ));
  //use cases
  injector
      .registerLazySingleton<GetCategories>(() => GetCategories(injector()));
  injector.registerLazySingleton<AddCategory>(() => AddCategory(injector()));
}
