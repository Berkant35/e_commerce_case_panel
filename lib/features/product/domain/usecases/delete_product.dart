


import 'package:ECommercePanel/core/usecases/base_usecase.dart';
import 'package:ECommercePanel/features/product/domain/repositories/product_repository.dart';

class DeleteProduct extends BaseUseCase<bool,String>{
  final ProductRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<bool> call(String params)async {
    return await repository.deleteProduct(params);
  }

}