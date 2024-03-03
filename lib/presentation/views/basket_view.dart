import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/generated/l10n.dart';
import 'package:salon/presentation/blocs/basket/basket_bloc.dart';
import 'package:salon/presentation/widgets/main_scaffold.dart';
import 'package:salon/presentation/widgets/product_item.dart';
import 'package:salon/presentation/widgets/progress_indicator.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBarTitle: S.of(context).basket,
        body: BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
          if (state is ProductsBasketState) {
            final totalPrice = S.of(context).totalPrice;
            return Column(
              children: [
                Text(
                    '${totalPrice} ${state.productsBasket.totalPrice.toString()}'),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.productsBasket.products.length,
                    itemBuilder: ((context, index) {
                      final product = state.productsBasket.products[index];
                      return ProductItem.basket(
                        name: product.name,
                        quantity: product.quantity,
                        price: product.price,
                        description: product.description,
                        totalPrice: product.totalPrice,
                      );
                    }))
              ],
            );
          } else if (state is EmptyBasket) {
            return Center(
              child: Text(S.of(context).emptyBasket),
            );
          } else {
            return const CustomProgressIndicator();
          }
        }));
  }
}
