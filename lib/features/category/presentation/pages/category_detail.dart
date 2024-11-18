import 'package:ECommercePanel/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_names.dart';
import '../../domain/entities/category_editable_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../category_detail_viewmodel_imp.dart';

// ConsumerStatefulWidget kullanarak kategori detayını takip ederiz.
final class CategoryDetail extends ConsumerStatefulWidget {
  const CategoryDetail({
    super.key,
  });

  @override
  ConsumerState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends ConsumerState<CategoryDetail> {
  final _categoryEditable = CategoryEditableEntity(); // Düzenlenebilir kategori nesnesi

  @override
  Widget build(BuildContext context) {
    final categoryEntity = ref.watch(selectedCategoryProvider);  // Kategori bilgisi

    // Kategori bilgilerini düzenlemek için TextEditingController
    TextEditingController nameController = TextEditingController(text: categoryEntity?.name);
    TextEditingController metaDescriptionController = TextEditingController(text: categoryEntity?.metaDescription);

    // Güncelleme işlemi yapılacak.
    void _updateCategory() {
      _categoryEditable.name = nameController.text;
      _categoryEditable.metaDescription = metaDescriptionController.text;

      // Burada gerekli güncelleme işlemleri yapılır.
      logger.w('Updated Category: ${_categoryEditable.toString()}');
      // Daha sonra güncellenen kategori ile işlemler yapılabilir.
    }

    return Scaffold(
      appBar: _CategoryDetailAppBar(
        onBack: () => context.goNamed(RouteNames.category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _CategoryDetailBody(
          categoryEntity: categoryEntity,
          nameController: nameController,
          metaDescriptionController: metaDescriptionController,
          updateCategory: _updateCategory,
        ),
      ),
    );
  }
}

/// **AppBar Widget**
class _CategoryDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onBack;

  const _CategoryDetailAppBar({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Category Detail'),
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: onBack,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// **Body Widget**
class _CategoryDetailBody extends StatelessWidget {
  final CategoryEntity? categoryEntity;
  final TextEditingController nameController;
  final TextEditingController metaDescriptionController;
  final VoidCallback updateCategory;

  const _CategoryDetailBody({
    Key? key,
    required this.categoryEntity,
    required this.nameController,
    required this.metaDescriptionController,
    required this.updateCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CategoryInfoTile(
          label: 'Name',
          value: categoryEntity?.name ?? "-",
          controller: nameController,
        ),
        _CategoryInfoTile(
          label: 'Meta Description',
          value: categoryEntity?.metaDescription ?? "-",
          controller: metaDescriptionController,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: updateCategory,  // Kategoriyi günceller
            child: const Text('Update Category'),
          ),
        ),
      ],
    );
  }
}

/// **Info Tile Widget (Editable)**
class _CategoryInfoTile extends StatelessWidget {
  final String label;
  final String value;
  final TextEditingController controller;

  const _CategoryInfoTile({
    super.key,
    required this.label,
    required this.value,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: TextField(
              controller: controller,  // TextField içine veriyi bağla
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: value,  // Varsayılan değeri gösterir
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
