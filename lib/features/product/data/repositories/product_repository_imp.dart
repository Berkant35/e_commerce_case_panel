


import 'package:ECommercePanel/features/product/data/datasources/product_remote_datasource.dart';
import 'package:ECommercePanel/features/product/domain/entities/product_entity.dart';

import 'package:ECommercePanel/features/product/domain/entities/proudct_detail_entity.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImp extends ProductRepository {
  final ProductRemoteDatasource productRemoteDatasource;


  ProductRepositoryImp({required this.productRemoteDatasource});

  @override
  Future<List<ProductEntity>> getProducts(String categoryId) async  {
    final products = await productRemoteDatasource.getProducts(categoryId);
    return products.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> addProduct(ProductDetailEntity product) async  {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(int id) async  {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductDetailEntity> getProduct(int id) async  {
    // TODO: implement getProduct
    throw UnimplementedError();
  }


}