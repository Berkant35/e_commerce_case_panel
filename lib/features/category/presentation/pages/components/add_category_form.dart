import 'package:ECommercePanel/core/enums/snack_bar_type.dart';
import 'package:ECommercePanel/core/extensions/padding_extension.dart';
import 'package:ECommercePanel/core/extensions/widget_extension.dart';
import 'package:ECommercePanel/core/widgets/snacks/snack_base.dart';
import 'package:ECommercePanel/features/category/presentation/category_viewmodel_imp.dart';
import 'package:ECommercePanel/features/category/presentation/pages/components/status_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCategoryForm extends ConsumerWidget {
  const AddCategoryForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final metaDescriptionController = TextEditingController();
    final metaKeywordsController = TextEditingController();
    final statusController = ValueNotifier<bool>(false);
    final loadingController = ValueNotifier<bool>(false);
    return Padding(
      padding: context.paddingNormal,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Kategori Ekle',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Kategori Adı',
                hintText: 'Kategori adı girin',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Kategori adı gereklidir';
                }
                return null;
              },
            ),
            TextFormField(
              controller: metaDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Meta Açıklama',
                hintText: 'Meta açıklama girin',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Meta açıklama gereklidir';
                }
                return null;
              },
            ),
            TextFormField(
              controller: metaKeywordsController,
              decoration: const InputDecoration(
                labelText: 'Meta Anahtar Kelimeler',
                hintText: 'Meta anahtar kelimeleri girin',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Meta anahtar kelimeleri gereklidir';
                }
                return null;
              },
            ),
            StatusSwitch(
              statusController: statusController,
              label: 'Status',
            ),
            ValueListenableBuilder(
                valueListenable: loadingController,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: !loadingController.value
                        ? () async {
                            if (formKey.currentState!.validate()) {
                              loadingController.value = true;
                              loadingController.notifyListeners();
                              // Save logic
                              final res = await ref
                                  .read(categoryProvider.notifier)
                                  .addCategory(
                                      name: nameController.text,
                                      metaDescription:
                                          metaDescriptionController.text,
                                      metaKeywords: metaKeywordsController.text
                                          .split(',')
                                          .map((e) => e.trim())
                                          .toList(),
                                      status: statusController.value);

                              if (res) {
                                SnackBase.showSnackBar(context,
                                    message: "Kategorilere Eklendi",
                                    type: SnackBarType.success);
                              } else {
                                SnackBase.showSnackBar(context,
                                    message: "Kategorilere Eklenemedi",
                                    type: SnackBarType.failed);
                              }

                              loadingController.value = false;
                              loadingController.notifyListeners();
                              // Close the bottom sheet
                              Navigator.pop(context);
                            }
                          }
                        : null,
                    child: !loadingController.value
                        ? const Text(
                            'Kaydet',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                  );
                }),
            SizedBox(height: 22.h,)
          ].withSpaceBetween(height: 4.h),
        ),
      ),
    );
  }
}
