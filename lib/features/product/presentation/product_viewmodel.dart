

import 'package:ECommercePanel/features/product/domain/entities/product_entity.dart';

abstract class ProductViewModel {
  Future<List<ProductEntity>> getProducts(String categoryId);

}