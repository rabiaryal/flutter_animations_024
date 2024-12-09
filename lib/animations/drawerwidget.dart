import 'package:flutter/material.dart';

class DrawerWidgets extends StatefulWidget {
  final Widget child;
  final Widget drawer;
  const DrawerWidgets({super.key,
  required this.child,
  required this.drawer,
  
  });

  @override
  State<DrawerWidgets> createState() => _DrawerWidgetsState();
}

class _DrawerWidgetsState extends State<DrawerWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
