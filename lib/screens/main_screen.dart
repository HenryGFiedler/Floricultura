import 'package:flutter/material.dart';
import '../components/menu_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget screen = Container();

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
        child: ListView(
          children: [
            for (var entry in MenuItemModel.menuItems.asMap().entries)
              ListTile(
                leading: Icon(entry.value.icon),
                title: Text(entry.value.title),
                onTap: () {
                  _mudarTela(entry.key);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}
