


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
  Future<bool> addProduct(Map<String,dynamic> product) async  {
    return await productRemoteDatasource.addProduct(product);
  }

  @override
  Future<bool> deleteProduct(String id) async  {
    return await productRemoteDatasource.deleteProduct(id);
  }

  @override
  Future<ProductDetailEntity> getProduct(int id) async  {
    // TODO: implement getProduct
    throw UnimplementedError();
  }


}