part of 'basket_bloc.dart';

sealed class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

final class BasketInitial extends BasketState {}

class ProductsBasketState extends BasketState {
  final ProductsBasket productsBasket;

  const ProductsBasketState(this.productsBasket);

  @override
  List<Object> get props => [productsBasket];
}

class ProductsBasketErrorState extends BasketState {
  final DioException? error;
  final String errorMsg;

  const ProductsBasketErrorState(this.errorMsg, {this.error});

  @override
  List<Object> get props => [
        errorMsg,
        {error}
      ];
}

class EmptyBasket extends BasketState {
  const EmptyBasket();
}
