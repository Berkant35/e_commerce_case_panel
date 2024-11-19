import 'package:ECommercePanel/core/usecases/base_usecase.dart';

import '../repositories/category_repository.dart';

class DeleteCategory extends BaseUseCase<bool,String> {
  final CategoryRepository repository;

  DeleteCategory(this.repository);

  @override
  Future<bool> call(String params) async {
    return repository.deleteCategory(params);
  }
}