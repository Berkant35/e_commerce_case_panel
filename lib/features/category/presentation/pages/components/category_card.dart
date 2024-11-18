

import 'package:ECommercePanel/core/extensions/radius_extension.dart';
import 'package:ECommercePanel/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class CategoryCard extends ConsumerStatefulWidget {
  final CategoryEntity category;
  const CategoryCard({
    super.key,
    required this.category,
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
        title: Text(widget.category.name),
        subtitle: Text(widget.category.metaDescription),
        isThreeLine: false,
        leading: Text("ID:${widget.category.id}"),
      ),
    );
  }
}
