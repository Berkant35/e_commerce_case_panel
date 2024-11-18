import 'package:ECommercePanel/core/routes/route_names.dart';
import 'package:ECommercePanel/core/widgets/buttons/app_button.dart';
import 'package:ECommercePanel/core/widgets/snacks/snack_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enums/snack_bar_type.dart';
import '../../domain/entities/category_editable_entity.dart';
import '../category_detail_viewmodel_imp.dart';

// ConsumerStatefulWidget kullanarak kategori detayını takip ederiz.
final class CategoryDetail extends ConsumerStatefulWidget {
  const CategoryDetail({
    super.key,
  });

  @override
  ConsumerState createState() => _CategoryDetailState();
}

final class _CategoryDetailState extends ConsumerState<CategoryDetail> {
  late TextEditingController nameController;
  late TextEditingController metaDescriptionController;
  late TextEditingController metaKeywordsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.goNamed(RouteNames.category);
          },
        ),
      ),
      body: FutureBuilder<CategoryEditableEntity?>(
        future: ref
            .read(selectedCategoryProvider.notifier)
            .getCategoryWithCategoryId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Bir hata oluştu'));
          } else {
            final editableCategory = snapshot.data;

            if (editableCategory != null) {
              // TextEditingController'ları her seferinde yeniden oluşturuyoruz.
              nameController =
                  TextEditingController(text: editableCategory.name);
              metaDescriptionController =
                  TextEditingController(text: editableCategory.metaDescription);
              metaKeywordsController =
                  TextEditingController(text: editableCategory.metaKeywords);

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CategoryInfoTile(
                      label: 'Name',
                      controller: nameController,
                    ),
                    _CategoryInfoTile(
                      label: 'Meta Description',
                      controller: metaDescriptionController,
                    ),
                    _CategoryInfoTile(
                      label: 'Meta Keywords',
                      controller: metaKeywordsController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          onPressed: () async {
                            final updatedCategory = editableCategory.copyWith(
                              name: nameController.text,
                              metaDescription: metaDescriptionController.text,
                              metaKeywords: metaKeywordsController.text,
                            );

                            final result = await ref
                                .read(selectedCategoryProvider.notifier)
                                .editCategory(updatedCategory);

                            SnackBase.showSnackBar(context,
                                message: result
                                    ? 'Kategori başarıyla güncellendi.'
                                    : 'Kategori güncellenirken bir hata oluştu.',
                                type: result
                                    ? SnackBarType.success
                                    : SnackBarType.failed);
                          },
                          label: 'Kaydet',
                        ),
                        AppButton(
                          onPressed: () => context.goNamed(RouteNames.product),
                          label: 'Ürünler',
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Kategori bulunamadı.'));
            }
          }
        },
      ),
    );
  }
}

/// **Info Tile Widget (Editable)**
class _CategoryInfoTile extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _CategoryInfoTile({
    super.key,
    required this.label,
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
              controller: controller, // TextField içine veriyi bağla
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
