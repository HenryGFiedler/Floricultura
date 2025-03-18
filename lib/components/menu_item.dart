import 'package:floricultura/screens/login_screen.dart';
import 'package:floricultura/screens/pedidos_screen.dart';
import 'package:flutter/material.dart';

class MenuItemModel {
  MenuItemModel({
    this.id,
    this.title = '',
    required this.icon,
    required this.screenBuilder,
  });

  UniqueKey? id = UniqueKey();
  String title;
  IconData icon;
  final Widget Function() screenBuilder;

  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      title: "Home",
      icon: Icons.home,
      screenBuilder: () => PedidosScreen(),
    ),
    MenuItemModel(
      title: "pei",
      icon: Icons.circle,
      screenBuilder: () => LoginScreen(),
    ),
  ];

}
