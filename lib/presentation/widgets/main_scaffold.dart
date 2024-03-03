import 'package:flutter/material.dart';
import 'package:salon/presentation/themes/colors.dart';

class MainScaffold extends StatefulWidget {
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
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: widget.floatingActionButton,
        appBar: widget.appBarTitle != null
            ? AppBar(
                backgroundColor: backgroundColor,
                title: Text(widget.appBarTitle ?? ''),
                actions: widget.actions,
              )
            : null,
        body: widget.body);
  }
}
