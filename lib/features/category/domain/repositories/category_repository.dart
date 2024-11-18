
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<bool> addCategory({
    required String name,
    required String metaDescription,
    required List<String> metaKeywords,
    required bool status,
  });
}