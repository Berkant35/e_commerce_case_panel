import 'package:ECommercePanel/core/enums/snack_bar_type.dart';
import 'package:ECommercePanel/core/extensions/radius_extension.dart';
import 'package:ECommercePanel/core/routes/route_names.dart';
import 'package:ECommercePanel/core/widgets/snacks/snack_base.dart';
import 'package:ECommercePanel/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../category_detail_viewmodel_imp.dart';
import '../../category_viewmodel_imp.dart';

final class CategoryCard extends ConsumerStatefulWidget {
  final CategoryEntity category;
  final VoidCallback onDelete;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onDelete,
  });

  @override
  ConsumerState createState() => _CategoryCardState();
}

class _CategoryCardState extends ConsumerState<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: context.radiusMedium,
        ),
        onTap: () {
          ref
              .read(selectedCategoryProvider.notifier)
              .changState(widget.category);
          context.goNamed(RouteNames.categoryDetail);
        },
        title: Text(widget.category.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.category.metaDescription),
            const Text(
              "Detaylar...",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
        isThreeLine: false,
        leading: Text("ID:${widget.category.id}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            ref
                .read(categoryProvider.notifier)
                .deleteCategory(widget.category.id)
                .then((value) {
              SnackBase.showSnackBar(context,
                  message: value
                      ? "Başarılı bir şekilde silindi"
                      : "Bir şeyler ters gitti",
                  type: value ? SnackBarType.success : SnackBarType.failed);
              widget.onDelete();
            });
          },
        ),
      ),
    );
  }
}
