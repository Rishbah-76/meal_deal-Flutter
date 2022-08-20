import 'package:flutter/material.dart';
import '../routes/categories_screen.dart';
import '../routes/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [CategoriesScreen(), Favourites()];

  void _selectPage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal_Deal"),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: const Color.fromARGB(255, 91, 57, 10),
          unselectedItemColor: Colors.deepOrange,
          selectedItemColor: Colors.amberAccent,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 91, 57, 10),
              label: "Cateogries",
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 91, 57, 10),
              label: "Favourites",
              icon: Icon(Icons.star),
            ),
          ]),
    );
  }
}
