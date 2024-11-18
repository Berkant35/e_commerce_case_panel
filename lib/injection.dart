
import 'package:get_it/get_it.dart';
import 'core/api_helper/api_connector.dart';
import 'core/locale_helper/hive_connector.dart';


GetIt injector = GetIt.instance;

reset(){
  injector.reset();
}

void initializeDependencies() {
  // ApiConnector lazy
  injector.registerLazySingleton<ApiConnector>(() => ApiConnector());
  // Hive Connector lazy
  injector.registerLazySingleton<HiveConnector>(()=>HiveConnector("e_commerce_case"));
  // Api

  //locale

  //Repositories

  //use cases

}