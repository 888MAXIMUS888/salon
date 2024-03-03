part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class SelectProductEvent extends BasketEvent {
  final int productId;

  const SelectProductEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class GetSavedProducts extends BasketEvent {
  const GetSavedProducts();
}
