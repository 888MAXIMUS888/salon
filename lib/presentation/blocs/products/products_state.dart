part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class GetProductsDone extends ProductsState {
  final List<Product> products;
  const GetProductsDone(this.products);

  @override
  List<Object> get props => [products];
}

class GetProductsError extends ProductsState {
  final DioException? error;
  final String errorMsg;

  const GetProductsError(this.errorMsg, {this.error});

  @override
  List<Object> get props => [
        errorMsg,
        {error}
      ];
}
