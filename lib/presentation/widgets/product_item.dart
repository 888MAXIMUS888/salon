import 'package:flutter/material.dart';
import 'package:salon/generated/l10n.dart';
import 'package:salon/presentation/themes/colors.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final int productQuantity;
  final double price;
  final String description;
  final String? image;
  final VoidCallback? onPressed;
  final double? totalPrice;

  const ProductItem(
      {required this.name,
      required this.productQuantity,
      required this.price,
      required this.description,
      this.image,
      this.onPressed,
      this.totalPrice,
      super.key});

  factory ProductItem.allProducts({
    required String name,
    required int quantity,
    required double price,
    required String description,
    required String image,
    required VoidCallback? onPressed,
  }) =>
      ProductItem(
        name: name,
        productQuantity: quantity,
        price: price,
        description: description,
        image: image,
        onPressed: onPressed,
      );

  factory ProductItem.basket(
          {required String name,
          required int quantity,
          required double price,
          required String description,
          required double totalPrice}) =>
      ProductItem(
        name: name,
        productQuantity: quantity,
        price: price,
        description: description,
        totalPrice: totalPrice,
      );

  @override
  Widget build(BuildContext context) {
    final String quantity = S.of(context).quantity;
    return Container(
      color: lightBlack,
      child: Column(
        children: [
          ListTile(
            title: Text(name),
            subtitle: Column(
              children: [
                Text(description),
                totalPrice == null
                    ? IconButton(
                        onPressed: () => onPressed?.call(),
                        icon: const Icon(Icons.add))
                    : const SizedBox()
              ],
            ),
            trailing: Column(children: [
              Text(price.toString()),
              Text('$quantity $productQuantity'),
            ]),
            leading: image != null ? Image.network(image!) : const SizedBox(),
          ),
          const Divider(
            thickness: 1,
            color: backgroundColor,
          )
        ],
      ),
    );
  }
}
