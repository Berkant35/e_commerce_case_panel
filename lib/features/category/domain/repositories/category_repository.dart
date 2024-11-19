
import '../entities/category_editable_entity.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<bool> addCategory({
    required String name,
    required String metaDescription,
    required List<String> metaKeywords,
    required bool status,
  });
  Future<bool> deleteCategory(String id);
  Future<CategoryEditableEntity> getCategory(String categoryId);
  Future<bool> editCategory(String categoryId,Map<String,dynamic> edited);
}