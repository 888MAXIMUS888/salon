part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}

final class GetAllProducts extends ProductsEvent {
  const GetAllProducts();

  @override
  List<Object?> get props => [];
}
