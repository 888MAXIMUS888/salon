import 'package:flutter/material.dart';
import 'package:salon/presentation/themes/colors.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final String? appBarTitle;
  final Widget? floatingActionButton;
  final VoidCallback? onPressed;
  final List<Widget>? actions;

  const MainScaffold(
      {required this.body,
      this.appBarTitle,
      this.floatingActionButton,
      this.onPressed,
      this.actions,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingActionButton,
        appBar: appBarTitle != null
            ? AppBar(
                backgroundColor: backgroundColor,
                title: Text(appBarTitle ?? ''),
                actions: actions,
              )
            : null,
        body: body);
  }
}
