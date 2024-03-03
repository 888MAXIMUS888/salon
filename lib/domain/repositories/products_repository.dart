import 'package:salon/core/data_state.dart';
import 'package:salon/data/models/requests/selected_product_request.dart';
import 'package:salon/domain/entities/product.dart';
import 'package:salon/domain/entities/selected_products.dart';

abstract class ProductsRepositories {
  Future<DataState<List<Product>>> getProducts();

  Future<DataState<ProductsBasket>> addProduct(
      List<SelectedProductRequest> selectedProducts);
}
