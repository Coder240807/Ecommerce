import 'package:flutter/material.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/allproducts.dart';
import 'package:ecommerceapp/widgets/productcard.dart';
import 'package:ecommerceapp/widgets/topbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Product> get _results {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return allProducts;
    return allProducts
        .where(
          (p) =>
              p.title.toLowerCase().contains(q) ||
              p.brand.toLowerCase().contains(q) ||
              p.category.toLowerCase().contains(q),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

    return (Scaffold(
      appBar: TopBar(
        isSearchPage: true,
        onSearchChanged: (value) => setState(() => _query = value),
      ),
      body: results.isEmpty
          ? const Center(child: Text('No products found'))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: results.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) =>
                  ProductCard(product: results[index]),
            ),
    ));
  }
}
