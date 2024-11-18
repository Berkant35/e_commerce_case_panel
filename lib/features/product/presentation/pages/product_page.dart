import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: const Center(
        child: Text('Product Page'),
      ),
    );
  }
}
