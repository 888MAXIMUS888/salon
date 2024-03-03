import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/core/data_state.dart';
import 'package:salon/data/datasources/local/shared_preferences_service.dart';
import 'package:salon/data/models/requests/selected_product_request.dart';
import 'package:salon/domain/entities/selected_products.dart';
import 'package:salon/domain/usecases/select_product_usecase.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final SelectProductUseCase _selectProductUseCase;
  final SharedPreferencesService _sharedPreferencesService;

  final List<SelectedProductRequest> _selectedProducts = [];

  BasketBloc(this._selectProductUseCase, this._sharedPreferencesService)
      : super(BasketInitial()) {
    on<SelectProductEvent>(_selectProduct);
    on<GetSavedProducts>(_getBasketProducts);
  }

  Future<void> _selectProduct(
      SelectProductEvent event, Emitter<BasketState> emit) async {
    _selectedProducts.add(SelectedProductRequest(productId: event.productId));
    _saveBasketProducts();
    await _checkoutProduct(emit);
  }

  void _saveBasketProducts() {
    _sharedPreferencesService
        .setBasketProducts(jsonEncode(_selectedProducts).toString());
  }

  Future<void> _getBasketProducts(
      GetSavedProducts event, Emitter<BasketState> emit) async {
    final basketProducts = await _sharedPreferencesService.getBasketProducts();
    if (basketProducts != null) {
      final List<SelectedProductRequest> selectedProductRequest =
          (jsonDecode(basketProducts) as List)
              .map((e) => SelectedProductRequest.fromJson(e))
              .toList();
      _selectedProducts.addAll(selectedProductRequest);

      await _checkoutProduct(emit);
    } else {
      emit(const EmptyBasket());
    }
  }

  Future<void> _checkoutProduct(Emitter<BasketState> emit) async {
    final dataState = await _selectProductUseCase(params: _selectedProducts);

    if (dataState is DataSuccess<ProductsBasket>) {
      emit(ProductsBasketState(dataState.data));
    }
    if (dataState is DataFailed<ProductsBasket>) {
      emit(
          ProductsBasketErrorState(dataState.errorMsg, error: dataState.error));
    }
  }
}
