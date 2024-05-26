import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class DashBoardScaffold extends StatelessWidget {
  final int index;
  final List<Widget> items;
  final void Function(int)? onTap;
  final Widget? body;

  const DashBoardScaffold({
    super.key,
    required this.index,
    required this.items,
    required this.body,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: Colors.transparent,
        color: Colors.transparent,
        buttonBackgroundColor: Colors.white,
        items: items,
        onTap: onTap,
      ),
      body: body,
    );
  }
}
