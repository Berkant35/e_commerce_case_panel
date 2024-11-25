import 'package:ECommercePanel/features/category/data/datasources/api_datasource/category_remote_datasource.dart';
import 'package:ECommercePanel/features/category/domain/repositories/category_repository.dart';
import 'package:ECommercePanel/features/category/domain/usecases/add_category.dart';
import 'package:ECommercePanel/features/category/domain/usecases/delete_category.dart';
import 'package:ECommercePanel/features/category/domain/usecases/edit_category.dart';
import 'package:ECommercePanel/features/category/domain/usecases/get_category.dart';
import 'package:ECommercePanel/features/product/data/datasources/product_remote_datasource.dart';
import 'package:ECommercePanel/features/product/domain/usecases/add_product.dart';
import 'package:ECommercePanel/features/product/domain/usecases/delete_product.dart';
import 'package:ECommercePanel/features/product/domain/usecases/get_products.dart';
import 'package:get_it/get_it.dart';

import 'core/api_helper/api_connector.dart';
import 'core/locale_helper/hive_connector.dart';
import 'features/category/data/datasources/api_datasource/category_remote_datasource_imp.dart';
import 'features/category/data/repositories/category_repositories_imp.dart';
import 'features/category/domain/usecases/get_categories.dart';
import 'features/product/data/datasources/product_remote_datasource_imp.dart';
import 'features/product/data/repositories/product_repository_imp.dart';
import 'features/product/domain/repositories/product_repository.dart';

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
  injector.registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDatasourceImp(apiConnector: injector()));

  //Repositories
  injector
      .registerLazySingleton<CategoryRepository>(() => CategoryRepositoriesImp(
            categoryRemoteDatasource: injector(),
          ));
  injector.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(
        productRemoteDatasource: injector(),
      ));

  //Use Cases
  injector
      .registerLazySingleton<GetCategories>(() => GetCategories(injector()));
  injector.registerLazySingleton<AddCategory>(() => AddCategory(injector()));
  injector
      .registerLazySingleton<DeleteCategory>(() => DeleteCategory(injector()));
  injector.registerLazySingleton<GetCategory>(() => GetCategory(injector()));
  injector.registerLazySingleton<EditCategory>(() => EditCategory(injector()));
  injector.registerLazySingleton<GetProducts>(() => GetProducts(injector()));
  injector.registerLazySingleton<AddProduct>(() => AddProduct(injector()));
  injector
      .registerLazySingleton<DeleteProduct>(() => DeleteProduct(injector()));
}
