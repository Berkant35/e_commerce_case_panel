import 'package:ECommercePanel/features/category/presentation/category_detail_viewmodel_imp.dart';
import 'package:ECommercePanel/features/product/presentation/pages/components/add_product_form.dart';
import 'package:ECommercePanel/features/product/presentation/product_viewmodel_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_names.dart';
import '../../domain/entities/product_entity.dart';
import 'components/product_cart.dart';

final class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({
    super.key,
  });

  @override
  ConsumerState createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final categoryEntity = ref.watch(selectedCategoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('${categoryEntity?.name} kategorisi ürünleri'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.goNamed(RouteNames.categoryDetail);
          },
        ),
      ),
      body: FutureBuilder<List<ProductEntity>>(
        future: ref
            .read(currentProductList.notifier)
            .getProducts(categoryEntity!.id),
        // Sorguyu buraya geçiriyoruz.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasData) {
            final products = snapshot.data!;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCart(
                  product: product,
                  onDelete: () => setState(() {}),
                );
              },
            );
          } else {
            return const Center(
              child: Text("No Data"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddProductForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const AddProductForm(),
    ).then((value) => setState(() {}));
  }
}
