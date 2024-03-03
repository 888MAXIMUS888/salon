class ProductsRequest {
  final List<SelectedProductRequest> products;

  const ProductsRequest({required this.products});

  factory ProductsRequest.fromJson(Map<String, dynamic> json) {
    return ProductsRequest(
        products: (json['products'] as List)
            .map((e) => SelectedProductRequest.fromJson(e))
            .toList());
  }
}

class SelectedProductRequest {
  static const String _fieldQuantity = 'quantity';
  static const String _fieldProductId = 'product_id';

  final int productId;
  final int? quantity;

  const SelectedProductRequest({required this.productId, this.quantity = 1});

  Map<String, dynamic> toJson() => <String, dynamic>{
        _fieldQuantity: quantity,
        _fieldProductId: productId,
      };

  factory SelectedProductRequest.fromJson(Map<String, dynamic> json) {
    return SelectedProductRequest(
      quantity: json[_fieldQuantity],
      productId: json[_fieldProductId],
    );
  }
}
