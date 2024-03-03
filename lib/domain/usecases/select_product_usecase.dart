import 'package:salon/core/data_state.dart';
import 'package:salon/data/models/requests/selected_product_request.dart';
import 'package:salon/domain/entities/selected_products.dart';
import 'package:salon/domain/repositories/products_repository.dart';
import 'package:salon/domain/usecases/uscase.dart';

class SelectProductUseCase
    implements UseCase<DataState<ProductsBasket>, List<SelectedProductRequest>> {
  SelectProductUseCase(this._productsRepositories);

  final ProductsRepositories _productsRepositories;

  @override
  Future<DataState<ProductsBasket>> call(
      {required List<SelectedProductRequest> params}) async {
    return await _productsRepositories.addProduct(params);
  }
}
