import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/core/data_state.dart';
import 'package:salon/domain/entities/product.dart';
import 'package:salon/domain/usecases/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsBloc(this._getProductsUseCase) : super(ProductsInitial()) {
    on<GetAllProducts>(_getAllProducts);
  }

  _getAllProducts(GetAllProducts event, Emitter<ProductsState> emit) async {
    final dataState = await _getProductsUseCase();
    if (dataState is DataSuccess<List<Product>>) {
      emit(GetProductsDone(dataState.data));
    }
    if (dataState is DataFailed<List<Product>>) {
      emit(GetProductsError(dataState.errorMsg, error: dataState.error));
    }
  }
}
