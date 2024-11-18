import 'package:ECommercePanel/core/api_helper/api_connector.dart';
import 'package:ECommercePanel/features/product/data/datasources/product_remote_datasource.dart';
import 'package:ECommercePanel/features/product/data/models/product.dart';
import 'package:ECommercePanel/features/product/domain/entities/proudct_detail_entity.dart';

import '../../../../core/config/paths.dart';

class ProductRemoteDatasourceImp extends ProductRemoteDatasource {
  final ApiConnector apiConnector;

  ProductRemoteDatasourceImp({required this.apiConnector});

  @override
  Future<void> addProduct(ProductDetailEntity product) async {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(int id) async {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProduct(int id) async {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts(String categoryId) async {
    var response = await apiConnector.get(Paths.products,
        queryParameters: "?${FilterPaths.categoryIds}=$categoryId}");
    final productList = (response as List<dynamic>).map((e) {
      final product = Product.fromJson(e as Map<String, dynamic>);
      return product;
    }).toList();
    return productList;
  }
}
