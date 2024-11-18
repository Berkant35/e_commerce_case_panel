import 'package:ECommercePanel/features/product/domain/entities/product_entity.dart';
import 'package:ECommercePanel/features/product/domain/usecases/get_products.dart';
import 'package:ECommercePanel/features/product/presentation/product_viewmodel.dart';
import 'package:ECommercePanel/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final products = injector<GetProducts>().call(categoryId);
    products.then((value) {
      changState(value);
    });
    return products;
  }
}
