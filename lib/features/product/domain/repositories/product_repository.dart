

import 'package:ECommercePanel/features/product/domain/entities/product_entity.dart';
import 'package:ECommercePanel/features/product/domain/entities/proudct_detail_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts(String categoryId);
  Future<ProductDetailEntity> getProduct(int id);
  Future<bool> addProduct(Map<String,dynamic> product);
  Future<bool> deleteProduct(String id);
}