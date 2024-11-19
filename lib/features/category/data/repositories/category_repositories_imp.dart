import 'package:ECommercePanel/features/category/domain/entities/category_editable_entity.dart';
import 'package:ECommercePanel/features/category/domain/entities/category_entity.dart';
import 'package:ECommercePanel/features/category/domain/repositories/category_repository.dart';

import '../datasources/api_datasource/category_remote_datasource.dart';

class CategoryRepositoriesImp extends CategoryRepository {
  final CategoryRemoteDatasource categoryRemoteDatasource;

  CategoryRepositoriesImp({required this.categoryRemoteDatasource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await categoryRemoteDatasource.getCategories();
    return categories.map((e) => e.toEntity()).toList();
  }

  @override
  Future<bool> addCategory(
      {required String name,
      required String metaDescription,
      required List<String> metaKeywords,
      required bool status}) async {
    final response = await categoryRemoteDatasource.addCategory(
        name: name,
        metaDescription: metaDescription,
        metaKeywords: metaKeywords,
        status: status);
    return response;
  }

  @override
  Future<bool> deleteCategory(String id) async {
    final response = await categoryRemoteDatasource.deleteCategory(id);
    return response;
  }

  @override
  Future<CategoryEditableEntity> getCategory(String categoryId) async {
    final category = await categoryRemoteDatasource.getCategory(categoryId);
    return category.toCategoryEditableEntity();
  }

  @override
  Future<bool> editCategory(
      String categoryId, Map<String, dynamic> edited) async {
    await categoryRemoteDatasource.editCategory(categoryId, edited);
    return true;
  }
}
