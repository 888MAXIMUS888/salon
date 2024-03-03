import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salon/data/models/products.dart';
import 'package:salon/data/models/requests/selected_product_request.dart';
import 'package:salon/data/models/selected_product.dart';

part 'app_api_service.g.dart';

@RestApi()
abstract class AppApiService {
  factory AppApiService(Dio dio) = _AppApiService;

  @GET('/products')
  Future<HttpResponse<Products>> getProducts();

  @POST('/checkout')
  Future<HttpResponse<CheckoutBasket>> addProduct(
      @Body() List<SelectedProductRequest> selectedProductRequest);
}
