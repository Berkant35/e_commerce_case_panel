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
}