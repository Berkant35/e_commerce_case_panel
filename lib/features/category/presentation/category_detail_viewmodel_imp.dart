import 'package:ECommercePanel/features/category/domain/entities/category_entity.dart';
import 'package:ECommercePanel/features/category/domain/usecases/get_category.dart';
import 'package:ECommercePanel/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../injection.dart';
import '../domain/entities/category_editable_entity.dart';
import '../domain/usecases/edit_category.dart';
import 'category_detail_viewmodel.dart';

final selectedCategoryProvider = StateNotifierProvider<
    SelectedCategoryEntityControlNotifier,
    CategoryEntity?>((ref) => SelectedCategoryEntityControlNotifier(null));

class SelectedCategoryEntityControlNotifier
    extends StateNotifier<CategoryEntity?>
    implements SelectedCategoryDetailViewModel {
  SelectedCategoryEntityControlNotifier(CategoryEntity? state) : super(null);

  void changState(CategoryEntity val){
    state = val;
  }

  @override
  Future<bool> editCategory(CategoryEditableEntity editableCategory) async {
    try{
      return await injector<EditCategory>().call(editableCategory.toMap());
    }catch(e){
      logger.e(e);
      return false;
    }
  }

  @override
  Future<CategoryEditableEntity?> getCategoryWithCategoryId() async {
    try{
      final editableCategory = await injector<GetCategory>().call(state!.id);
      return editableCategory;
    }catch(e){
      logger.e(e);
      return null;
    }
  }
}
