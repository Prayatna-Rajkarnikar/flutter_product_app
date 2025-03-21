class Product {
  final int id;
  final String title;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> product) {
    return Product(
      id: product['id'],
      title: product['title'],
      image: product['thumbnail'],
      price: product['price'].toDouble(),
    );
  }
}
