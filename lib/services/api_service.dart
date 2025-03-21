import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_app/models/product.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to get products");
    }
  }

  static Future<Product> fetchProductDetail(int id) async {
    final response = await http.get(
      Uri.parse(": https://dummyjson.com/products/{id}"),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load product details");
    }
  }
}

Future<List<Product>> searchProducts(String query) async {
  final response = await http.get(
    Uri.parse("https://dummyjson.com/products/search?q=your_query."),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return (data['products'] as List).map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception("Failed to search products");
  }
}

Future<List<Product>> sortProducts() async {
  final response = await http.get(
    Uri.parse("https://dummyjson.com/products?sortBy=title&order=asc"),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return (data['products'] as List).map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception("Failed to sort products");
  }
}
