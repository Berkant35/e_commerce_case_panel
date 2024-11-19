import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/category_entity.dart';
import '../category_viewmodel_imp.dart';
import 'components/add_category_form.dart';
import 'components/category_card.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: FutureBuilder<List<CategoryEntity>>(
        future: ref.read(categoryProvider.notifier).getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          } else if (snapshot.hasData) {
            final categories = snapshot.data;
            return ListView.builder(
              itemCount: categories!.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  category: category,
                  onDelete: () => setState(() {}),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCategoryForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCategoryForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const SafeArea(child: AddCategoryForm()),
    ).then((value) => setState(() {}));
  }
}
