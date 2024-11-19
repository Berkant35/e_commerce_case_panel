

import 'package:ECommercePanel/features/product/data/models/product.dart';
import 'package:ECommercePanel/features/product/domain/entities/proudct_detail_entity.dart';

abstract class ProductRemoteDatasource{
  Future<List<Product>> getProducts(String categoryId);
  Future<Product> getProduct(int id);
  Future<bool> addProduct(Map<String,dynamic> data);
  Future<bool> deleteProduct(String id);
}