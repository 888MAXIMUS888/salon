import 'package:salon/data/models/selected_product.dart';
import 'package:salon/domain/entities/selected_products.dart' as entity;

class SelectProductsMapper {
  static entity.ProductsBasket listFromApi(CheckoutBasket products) {
    return entity.ProductsBasket(
        totalPrice: products.selectedProducts.totalPrice,
        products: products.selectedProducts.products
            .map(
              (e) => entity.SelectedProduct(
                id: e.id,
                name: e.name,
                quantity: e.quantity,
                price: e.price,
                description: e.description,
                image: e.image,
                totalPrice: e.totalPrice,
              ),
            )
            .toList());
  }
}
