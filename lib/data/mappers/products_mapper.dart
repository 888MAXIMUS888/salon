import 'package:salon/data/models/products.dart';
import 'package:salon/domain/entities/product.dart' as entities;

class ProductsMapper {
  static List<entities.Product> listFromApi(Products products) {
    return products.products
        .map(
          (e) => entities.Product(
            id: e.id,
            name: e.name,
            quantity: e.quantity,
            price: e.price,
            description: e.description,
            image: e.image,
          ),
        )
        .toList();
  }
}
