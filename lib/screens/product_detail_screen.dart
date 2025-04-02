import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/services/api_service.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FutureBuilder<Product>(
          future: ApiService.fetchProductDetail(productId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return Center(child: Text("Product not found"));
            }

            final product = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          product.image,
                          height: 200,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    " Price: Rs ${product.price.toString()}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),

                  Text(
                    "Category: ${product.category}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),

                      SizedBox(width: 5),
                      Text(
                        "(${product.rating} / 5)",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
