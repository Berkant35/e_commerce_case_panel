

import 'package:ECommercePanel/features/category/data/models/category.dart';

abstract class CategoryRemoteDatasource {
  Future<List<Category>> getCategories();
  Future<bool> addCategory({
    required String name,
    required String metaDescription,
    required List<String> metaKeywords,
    required bool status,
});
  Future<bool> deleteCategory(String id);
  Future<Category> getCategory(String categoryId);
}