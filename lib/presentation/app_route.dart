import 'package:flutter/material.dart';
import 'package:salon/presentation/views/basket_view.dart';
import 'package:salon/presentation/views/products_view.dart';

class AppRoutes {
  // screens
  static const PRODUCTS_VIEW = 'productsView';
  static const BASKET_VIEW = 'BasketView';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PRODUCTS_VIEW:
        return _materialRoute(const ProductsView());
      case BASKET_VIEW:
        return _materialRoute(const BasketView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view,
      {RouteSettings? routeSettings}) {
    return MaterialPageRoute(
      builder: (_) => Builder(
        builder: (BuildContext context) => MediaQuery(
          data: MediaQuery.of(context),
          child: view,
        ),
      ),
      settings: routeSettings,
    );
  }
}
