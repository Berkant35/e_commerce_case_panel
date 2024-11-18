

import 'package:ECommercePanel/features/category/domain/entities/category_entity.dart';

abstract class CategoryViewModel {
  Future<List<CategoryEntity>> getCategories();
  Future<void> addCategory({
    required String name,
    required String metaDescription,
    required List<String> metaKeywords,
    required bool status,
  });
  Future<void> deleteCategory(String id);
}