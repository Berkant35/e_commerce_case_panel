import 'package:ECommercePanel/features/product/domain/entities/product_entity.dart';
import 'package:ECommercePanel/features/product/domain/usecases/delete_product.dart';
import 'package:ECommercePanel/features/product/domain/usecases/get_products.dart';
import 'package:ECommercePanel/features/product/presentation/product_viewmodel.dart';
import 'package:ECommercePanel/injection.dart';
import 'package:ECommercePanel/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/add_product.dart';

final currentProductList =
    StateNotifierProvider<ProductsControlNotifier, List<ProductEntity>>((ref) {
  return ProductsControlNotifier([]);
});

class ProductsControlNotifier extends StateNotifier<List<ProductEntity>>
    implements ProductViewModel {
  ProductsControlNotifier(List<ProductEntity> state) : super([]);

  void changState(List<ProductEntity> val) => state = val;

  @override
  Future<List<ProductEntity>> getProducts(String categoryId) async {
    try{
      final products = injector<GetProducts>().call(categoryId);
      products.then((value) {
        changState(value);
      });
      return products;
    }catch(e){
      logger.e("Error: $e");
      return [];
    }
  }

  @override
  Future<bool> addProduct(Map<String, dynamic> params) async {
    try{
      final result = await injector<AddProduct>().call(params);
      return result;
    }catch(e){
      logger.e("Error: $e");
      return false;
    }
  }

  @override
  Future<bool> deleteProduct(String id)  async {
    try{
      final result = await injector<DeleteProduct>().call(id);
      state = state.where((element) => element.id != id).toList();
      return result;
    }catch(e){
      logger.e("Error: $e");
      return false;
    }
  }
}
