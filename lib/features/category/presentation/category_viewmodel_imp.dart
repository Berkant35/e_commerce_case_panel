import 'package:ECommercePanel/features/category/domain/entities/category_entity.dart';
import 'package:ECommercePanel/features/category/domain/usecases/add_category.dart';
import 'package:ECommercePanel/features/category/domain/usecases/delete_category.dart';
import 'package:ECommercePanel/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../injection.dart';
import '../domain/usecases/get_categories.dart';
import 'category_viewmodel.dart';

final categoryProvider =
    StateNotifierProvider<CategoriesControlNotifier, List<CategoryEntity>>(
        (ref) => CategoriesControlNotifier([]));

class CategoriesControlNotifier extends StateNotifier<List<CategoryEntity>>
    implements CategoryViewModel {
  CategoriesControlNotifier(List<CategoryEntity> state) : super([]);

  void changState(List<CategoryEntity> val) => state = val;

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final res = await injector<GetCategories>().call(null);
      res.then((list) {
        changState(list);
      });
      return res;
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  Future<bool> addCategory(
      {required String name,
      required String metaDescription,
      required List<String> metaKeywords,
      required bool status}) async {
    try {

      final res = await injector<AddCategory>().call({
        "name": name,
        "metaDescription": metaDescription,
        "metaKeywords": metaKeywords,
        "status": status
      });

      if (res) {
        final list = await injector<GetCategories>().call(null);
        list.then((value) {
          changState(value);
        });
      }
      return res;
    }catch(e){
      logger.e(e);
      return false;
    }
  }

  @override
  Future<bool> deleteCategory(String id) async {
    final res = await injector<DeleteCategory>().call(id);
    if (res) {
      final list = await injector<GetCategories>().call(null);
      list.then((value) {
        changState(value);
      });
    }
    return res;
  }
}
