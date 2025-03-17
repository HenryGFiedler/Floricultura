import 'package:floricultura/components/info_card.dart';
import 'package:flutter/material.dart';
import '../components/menu_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget screen = Container(
    child: InfoCard(),
  );

  void _mudarTela(int index) {
    setState(() {
      screen = MenuItemModel.menuItems[index].screenBuilder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: screen,
      drawer: Drawer(
        child: ListView.builder(
          itemCount: MenuItemModel.menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(MenuItemModel.menuItems[index].icon),
                  title: Text(MenuItemModel.menuItems[index].title),
                  onTap: () {
                    _mudarTela(index);
                    Navigator.pop(context);
                  },
                );
              }
        ),
      ),
    );
  }
}
