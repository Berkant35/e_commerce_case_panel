import 'package:ECommercePanel/core/usecases/base_usecase.dart';
import 'package:ECommercePanel/features/category/domain/repositories/category_repository.dart';

import '../entities/category_editable_entity.dart';

class GetCategory extends BaseUseCase<CategoryEditableEntity,String>{
  final CategoryRepository categoryRepository;

  GetCategory(this.categoryRepository);

  @override
  Future<CategoryEditableEntity> call(String params) async {
    return await categoryRepository.getCategory(params);
  }

}