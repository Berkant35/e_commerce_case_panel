

import 'package:ECommercePanel/features/product/domain/entities/product_entity.dart';

abstract class ProductViewModel {
  Future<List<ProductEntity>> getProducts(String categoryId);
  Future<bool> addProduct(Map<String,dynamic> params);
  Future<bool> deleteProduct(String id);
}