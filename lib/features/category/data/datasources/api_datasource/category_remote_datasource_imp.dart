import 'package:ECommercePanel/core/api_helper/api_connector.dart';
import 'package:ECommercePanel/core/extensions/bool_extension.dart';
import 'package:ECommercePanel/features/category/data/datasources/api_datasource/category_remote_datasource.dart';
import 'package:ECommercePanel/features/category/data/models/category.dart';
import 'package:ECommercePanel/main.dart';

import '../../../../../core/config/paths.dart';

class CategoryRemoteDatasourceImp extends CategoryRemoteDatasource {
  final ApiConnector apiConnector;

  CategoryRemoteDatasourceImp({required this.apiConnector});

  @override
  Future<bool> addCategory({
    required String name,
    required String metaDescription,
    required List<String> metaKeywords,
    required bool status,
  }) async {
    var response = await apiConnector.post(Paths.categories, body: {
      "name": name,
      "status": status.toInt(),
      "metaDescription": metaDescription,
      "metaKeywords": metaKeywords.join(","),
    });
    bool isSuccessful = false;
    if(response.runtimeType == Map<String, dynamic>){
      isSuccessful = (response["name"] as String).toLowerCase() == name.toLowerCase();
    }
    logger.w("Add category success status: $isSuccessful");

    return true;
  }

  @override
  Future<void> deleteCategory(String id) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getCategories() async {
    var response = await apiConnector.get(Paths.categories);
    final categoryList = (response as List<dynamic>).map((e) {
      final category = Category.fromJson(e as Map<String, dynamic>);
      return category;
    }).toList();
    return categoryList;
  }
}
