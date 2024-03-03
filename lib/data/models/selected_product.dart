class CheckoutBasket {
  static const String _fieldCheckout = 'checkout';

  final SelectedProducts selectedProducts;
  CheckoutBasket({required this.selectedProducts});

  factory CheckoutBasket.fromJson(Map<String, dynamic> json) {
    return CheckoutBasket(
        selectedProducts: SelectedProducts.fromJson(json[_fieldCheckout]));
  }
}

class SelectedProducts {
  static const String _fieldTotalPrice = 'total_price';
  static const String _fieldItems = 'items';
  final double totalPrice;
  final List<SelectedProduct> products;

  SelectedProducts({required this.totalPrice, required this.products});

  factory SelectedProducts.fromJson(Map<String, dynamic> json) {
    return SelectedProducts(
        totalPrice: json[_fieldTotalPrice],
        products: (json[_fieldItems] as List)
            .map((e) => SelectedProduct.fromJson(e))
            .toList());
  }
}

class SelectedProduct {
  static const String _fieldId = 'id';
  static const String _fieldName = 'name';
  static const String _fieldQuantity = 'quantity';
  static const String _fieldPrice = 'price';
  static const String _fieldDescription = 'description';
  static const String _fieldImage = 'image';
  static const String _fieldTotalPrice = 'total_price';

  final int id;
  final String name;
  final int quantity;
  final double price;
  final String description;
  final String image;
  final double totalPrice;

  SelectedProduct(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price,
      required this.description,
      required this.image,
      required this.totalPrice});

  factory SelectedProduct.fromJson(Map<String, dynamic> json) {
    return SelectedProduct(
      id: json[_fieldId],
      name: json[_fieldName],
      quantity: json[_fieldQuantity],
      price: json[_fieldPrice],
      description: json[_fieldDescription],
      image: json[_fieldImage],
      totalPrice: json[_fieldTotalPrice],
    );
  }
}
