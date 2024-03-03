import 'package:salon/core/data_state.dart';
import 'package:salon/domain/entities/product.dart';
import 'package:salon/domain/repositories/products_repository.dart';
import 'package:salon/domain/usecases/uscase.dart';

class GetProductsUseCase
    implements UseCase<DataState<List<Product>>, NoParams> {
  GetProductsUseCase(this._productsRepositories);

  final ProductsRepositories _productsRepositories;

  @override
  Future<DataState<List<Product>>> call({NoParams? params}) async {
    return await _productsRepositories.getProducts();
  }
}
