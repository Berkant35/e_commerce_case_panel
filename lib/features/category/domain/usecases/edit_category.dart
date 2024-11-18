


import 'package:ECommercePanel/core/usecases/base_usecase.dart';

import '../repositories/category_repository.dart';

class EditCategory extends BaseUseCase<bool, Map<String,dynamic>> {
  final CategoryRepository repository;

  EditCategory(this.repository);

  @override
  Future<bool> call(Map<String,dynamic> params) async {
    return  repository.editCategory(params['id'].toString(), params);
  }

}