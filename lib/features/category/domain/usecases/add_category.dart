



import 'package:ECommercePanel/core/usecases/base_usecase.dart';

import '../repositories/category_repository.dart';

class AddCategory extends BaseUseCase<bool,Map<String,dynamic>>{
  final CategoryRepository repository;

  AddCategory(this.repository);

  @override
  Future<bool> call(Map<String, dynamic> params) async {
    return repository.addCategory(
      name: params["name"],
      metaDescription: params["metaDescription"],
      metaKeywords: params["metaKeywords"],
      status: params["status"]
    );
  }

}