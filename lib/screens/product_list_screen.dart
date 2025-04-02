import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/screens/product_detail_screen.dart';
import 'package:product_app/services/api_service.dart';

import '../services/api_service.dart' as api_service;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> products;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    products = ApiService.fetchProducts();
  }

  void searchProducts(String query) {
    setState(() {
      products = api_service.searchProducts(query);
    });
  }

  void sortProducts() {
    setState(() {
      products = api_service.sortProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        actions: [
          IconButton(
            onPressed: sortProducts,
            icon: Icon(Icons.sort_by_alpha_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),

              onChanged: (query) => searchProducts(query),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No products found"));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ProductDetailScreen(
                                    productId: product.id,
                                  ),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    product.image,
                                    width: 100,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.headlineMedium,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Rs ${product.price.toString()}",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.labelSmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
