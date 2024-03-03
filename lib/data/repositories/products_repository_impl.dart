import 'package:salon/core/data_state.dart';
import 'package:salon/data/datasources/remote/app_api_service.dart';
import 'package:salon/data/extensions/api_extensions.dart';
import 'package:salon/data/mappers/products_mapper.dart';
import 'package:salon/data/mappers/selected_products_mapper.dart';
import 'package:salon/data/models/requests/selected_product_request.dart';
import 'package:salon/domain/entities/product.dart';
import 'package:salon/domain/entities/selected_products.dart';
import 'package:salon/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepositories {
  final AppApiService _appApiService;

  ProductsRepositoryImpl(this._appApiService);

  @override
  Future<DataState<List<Product>>> getProducts() async {
    return await doSafeApiCall(() async => await _appApiService.getProducts(),
        ProductsMapper.listFromApi);
  }

  @override
  Future<DataState<ProductsBasket>> addProduct(
      List<SelectedProductRequest> selectedProducts) async {
    return await doSafeApiCall(
        () async => await _appApiService.addProduct(selectedProducts),
        SelectProductsMapper.listFromApi);
  }
}
