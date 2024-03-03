class Products {
  static const String _fieldProducts = 'products';
  final List<Product> products;

  Products({required this.products});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        products: (json[_fieldProducts] as List)
            .map((e) => Product.fromJson(e))
            .toList());
  }
}

class Product {
  static const String _fieldId = 'id';
  static const String _fieldName = 'name';
  static const String _fieldQuantity = 'quantity';
  static const String _fieldPrice = 'price';
  static const String _fieldDescription = 'description';
  static const String _fieldImage = 'image';

  final int id;
  final String name;
  final int quantity;
  final double price;
  final String description;
  final String image;

  Product(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price,
      required this.description,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json[_fieldId],
      name: json[_fieldName],
      quantity: json[_fieldQuantity],
      price: json[_fieldPrice],
      description: json[_fieldDescription],
      image: json[_fieldImage],
    );
  }
}
