import 'package:ECommercePanel/core/enums/snack_bar_type.dart';
import 'package:ECommercePanel/core/extensions/padding_extension.dart';
import 'package:ECommercePanel/core/extensions/radius_extension.dart';
import 'package:ECommercePanel/core/widgets/snacks/snack_base.dart';
import 'package:ECommercePanel/features/product/presentation/product_viewmodel_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/product_entity.dart';

class ProductCart extends ConsumerWidget {
  final ProductEntity product;
  final VoidCallback onDelete;
  const ProductCart({
    super.key,
    required this.product,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.paddingNormal,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: context.radiusLow,
          ),
          elevation: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  "https:${product.image}",
                  height: 100, // Daha küçük görsel
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      color: Colors.grey[200],
                      child:
                          const Icon(Icons.error, size: 40, color: Colors.red),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${product.price} ${product.currency}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              //delete
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref
                      .read(currentProductList.notifier)
                      .deleteProduct(product.id)
                      .then((value) {
                    SnackBase.showSnackBar(context,
                        message: value
                            ? "Silme işlemi başarılı"
                            : "Bir şeyler ters gitti",
                        type:
                            value ? SnackBarType.success : SnackBarType.failed);
                    onDelete();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    ); // Arama sorgusuna uymuyorsa boş bir widget döndür
  }
}
