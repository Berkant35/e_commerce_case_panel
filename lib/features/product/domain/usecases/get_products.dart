


import 'package:ECommercePanel/core/usecases/base_usecase.dart';
import 'package:ECommercePanel/features/product/domain/entities/product_entity.dart';
import 'package:ECommercePanel/features/product/domain/repositories/product_repository.dart';

class GetProducts extends BaseUseCase<List<ProductEntity>,String>{
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<List<ProductEntity>> call(String params) async {
    return repository.getProducts(params);
  }

}