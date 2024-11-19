import 'package:ECommercePanel/core/extensions/bool_extension.dart';
import 'package:ECommercePanel/core/extensions/padding_extension.dart';
import 'package:ECommercePanel/core/extensions/widget_extension.dart';
import 'package:ECommercePanel/features/product/presentation/product_viewmodel_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/enums/snack_bar_type.dart';
import '../../../../../core/widgets/snacks/snack_base.dart';
import '../../../../category/presentation/category_detail_viewmodel_imp.dart';

class AddProductForm extends ConsumerWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final slugController = TextEditingController();
    final sku = TextEditingController();
    final priceController = TextEditingController();
    final stockController = TextEditingController();
    final descriptionController = TextEditingController();
    final metaDescriptionController = TextEditingController();
    final metaKeywordsController = TextEditingController();
    final loadingController = ValueNotifier<bool>(false);

    return SizedBox(
      height: 80.h,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: context.paddingMedium,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Ürün Ekle',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Ürün Adı',
                    hintText: 'Ürün adını girin',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ürün adı gereklidir';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: slugController,
                  decoration: const InputDecoration(
                    labelText: 'Slug',
                    hintText: 'Ürün slug girin',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Slug gereklidir';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Fiyat',
                    hintText: 'Ürün fiyatını girin',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Fiyat gereklidir';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Geçerli bir fiyat girin';
                    }
                    return null;
                  },
                ),
                //sku
                TextFormField(
                  controller: sku,
                  decoration: const InputDecoration(
                    labelText: 'SKU',
                    hintText: 'Ürün sku girin',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'SKU gereklidir';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Stok Miktarı',
                    hintText: 'Stok miktarını girin',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Stok miktarı gereklidir';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Geçerli bir sayı girin';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Ürün Açıklaması',
                    hintText: 'Ürün açıklaması girin',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ürün açıklaması gereklidir';
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
                    hintText: 'Meta anahtar kelimeleri girin (virgülle ayırın)',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Meta anahtar kelimeler gereklidir';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),
                ValueListenableBuilder(
                  valueListenable: loadingController,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: !loadingController.value
                          ? () async {
                              if (formKey.currentState!.validate()) {
                                loadingController.value = true;
                                final result = await ref
                                    .read(currentProductList.notifier)
                                    .addProduct({
                                  "name": nameController.text,
                                  "slug": slugController.text,
                                  "sku": sku.text,
                                  "price1": double.parse(priceController.text),
                                  "stockAmount":
                                      int.parse(stockController.text),
                                  "currency": {
                                    "id": 1,
                                    "label": "USD",
                                    "abbr": "USD",
                                    "status": 1,
                                  },
                                  "categories": [
                                    ref.read(selectedCategoryProvider)!.toMap()
                                  ],
                                  "description": descriptionController.text,
                                  "metaDescription":
                                      metaDescriptionController.text,
                                  "metaKeywords": metaKeywordsController.text
                                      .split(',')
                                      .map((e) => e.trim())
                                      .toList(),
                                  "status": true.toInt(),
                                });

                                if (context.mounted) {
                                  if (result) {
                                    SnackBase.showSnackBar(context,
                                        message: "Ürün başarıyla eklendi",
                                        type: SnackBarType.success);
                                    Navigator.pop(context);
                                  } else {
                                    SnackBase.showSnackBar(context,
                                        message: "Ürün eklenemedi",
                                        type: SnackBarType.failed);
                                  }
                                }

                                loadingController.value = false;
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
                  },
                ),
                const SizedBox(height: 24),
              ].withSpaceBetween(height: 1.h),
            ),
          ),
        ),
      ),
    );
  }
}
