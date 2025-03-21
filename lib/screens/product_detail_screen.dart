import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/services/api_service.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Product>(
        future: ApiService.fetchProductDetail(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final product = snapshot.data!;
          return Column(
            children: [
              Image.network(product.image, height: 200, fit: BoxFit.cover),
              Text(product.title),
              Text(product.price.toString()),
            ],
          );
        },
      ),
    );
  }
}
