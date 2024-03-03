import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salon/generated/l10n.dart';
import 'package:salon/presentation/blocs/basket/basket_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.dart';
import 'presentation/app_route.dart';
import 'presentation/blocs/products/products_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies(await SharedPreferences.getInstance());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<ProductsBloc>()),
        BlocProvider(create: (context) => injector<BasketBloc>()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.PRODUCTS_VIEW,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
