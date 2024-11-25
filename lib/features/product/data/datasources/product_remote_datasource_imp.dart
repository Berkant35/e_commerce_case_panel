import 'package:ECommercePanel/core/api_helper/api_connector.dart';
import 'package:ECommercePanel/features/product/data/datasources/product_remote_datasource.dart';
import 'package:ECommercePanel/features/product/data/models/product.dart';

import '../../../../core/config/paths.dart';

class ProductRemoteDatasourceImp extends ProductRemoteDatasource {
  final ApiConnector apiConnector;

  ProductRemoteDatasourceImp({required this.apiConnector});

  @override
  Future<bool> addProduct(Map<String, dynamic> data) async {
    await apiConnector.post(Paths.products, body: data);
    return true;
  }

  @override
  Future<bool> deleteProduct(String id) async {
    await apiConnector.delete(Paths.products, queryParameters: "/$id");
    return true;
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
