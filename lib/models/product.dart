class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final double discountPercentage;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.discountPercentage,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> product) {
    return Product(
      id: product['id'],
      title: product['title'],
      description: product['description'],
      category: product['category'],
      image: product['thumbnail'],
      price: product['price'].toDouble(),
      rating: product['rating'].toDouble(),
      discountPercentage: product['discountPercentage'].toDouble(),
    );
  }
}
