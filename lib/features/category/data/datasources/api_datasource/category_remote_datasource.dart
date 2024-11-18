

import 'package:ECommercePanel/features/category/data/models/category.dart';

abstract class CategoryRemoteDatasource {
  Future<List<Category>> getCategories();
  Future<bool> addCategory({
    required String name,
    required String metaDescription,
    required List<String> metaKeywords,
    required bool status,
});
  Future<void> deleteCategory(String id);
}