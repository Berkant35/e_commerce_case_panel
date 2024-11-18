


import 'package:ECommercePanel/core/usecases/base_usecase.dart';
import 'package:ECommercePanel/features/product/domain/repositories/product_repository.dart';

class AddProduct extends BaseUseCase<bool,Map<String,dynamic>>{
  final ProductRepository repository;

  AddProduct(this.repository);

  @override
  Future<bool> call(Map<String, dynamic> params)async {
     return repository.addProduct(params);
  }

}