import 'package:flutter/material.dart';
import 'package:garuda_gear/models/product_entry.dart';
import 'package:garuda_gear/screens/product_detail.dart';
import 'package:garuda_gear/widgets/left_drawer.dart';
import 'package:garuda_gear/widgets/product_entry_card.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  final bool userOnly;

  const ProductListPage({super.key, this.userOnly = false});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    try {
      // Untuk Android emulator gunakan http://10.0.2.2:8000
      // Untuk Chrome gunakan http://localhost:8000
      // Gunakan endpoint JSON langsung
      final url = widget.userOnly
          ? 'http://localhost:8000/json/user/'
          : 'http://localhost:8000/json/';

      final response = await request.get(url);

      // Response dari endpoint json/ adalah list langsung
      List<ProductEntry> listProduct = [];

      // Cek apakah response adalah List
      if (response is List) {
        for (var d in response) {
          if (d != null) {
            listProduct.add(ProductEntry.fromJson(d));
          }
        }
      }

      return listProduct;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userOnly ? 'My Products' : 'Product List'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => setState(() {}),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.userOnly ? Icons.shopping_bag : Icons.shopping_bag,
                    size: 80,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.userOnly
                        ? 'You haven\'t added any products yet.'
                        : 'There are no products in Garuda Gear.',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: snapshot.data![index]),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
