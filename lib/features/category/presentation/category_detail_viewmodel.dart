

import 'package:ECommercePanel/features/category/domain/entities/category_editable_entity.dart';

abstract class SelectedCategoryDetailViewModel {
  Future<CategoryEditableEntity?> getCategoryWithCategoryId();
  Future<void> editCategory();
}