import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/generated/l10n.dart';
import 'package:salon/presentation/app_route.dart';
import 'package:salon/presentation/blocs/basket/basket_bloc.dart';
import 'package:salon/presentation/blocs/products/products_bloc.dart';
import 'package:salon/presentation/themes/colors.dart';
import 'package:salon/presentation/widgets/main_scaffold.dart';
import 'package:salon/presentation/widgets/product_item.dart';
import 'package:salon/presentation/widgets/progress_indicator.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(const GetAllProducts());
    BlocProvider.of<BasketBloc>(context).add(const GetSavedProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      actions: [
        IconButton(
            iconSize: 40,
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.BASKET_VIEW),
            icon: const Icon(
              Icons.shopify_outlined,
              color: yellow,
            ))
      ],
      appBarTitle: S.of(context).allProducts,
      body: BlocBuilder<ProductsBloc, ProductsState>(builder: (_, state) {
        if (state is GetProductsDone) {
          return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: ((context, index) {
                final product = state.products[index];
                return ProductItem.allProducts(
                  onPressed: () {
                    context
                        .read<BasketBloc>()
                        .add(SelectProductEvent(product.id));
                  },
                  name: product.name,
                  quantity: product.quantity,
                  price: product.price,
                  description: product.description,
                  image: product.image,
                );
              }));
        } else {
          return const CustomProgressIndicator();
        }
      }),
    );
  }
}
