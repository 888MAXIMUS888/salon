class ProductsBasket {
  final double totalPrice;
  final List<SelectedProduct> products;

  ProductsBasket({required this.products, required this.totalPrice});
}

class SelectedProduct {
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
}
