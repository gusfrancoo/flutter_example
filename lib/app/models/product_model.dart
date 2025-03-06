class Product {
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  // Cria um Product a partir de JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

}