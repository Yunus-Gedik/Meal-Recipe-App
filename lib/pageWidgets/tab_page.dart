import 'package:flutter/material.dart';
import 'package:meal/pageWidgets/categories_page.dart';
import 'package:meal/pageWidgets/category_detail.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  static const Widget _categoriesWidget = const Categories();
  Widget _favoritesWidget = const CategoryDetail();
  // Default tab
  Widget _selectedPageWidget = _categoriesWidget;
  String _pageTitle = "Categories";
  int _tabIndex = 0;

  tabBarOnTap(int index){
    if(_tabIndex == index){
      print("same index clicked");
      return;
    }

    setState(() {
      if(index == 1){
        _selectedPageWidget = _favoritesWidget;
        _pageTitle = "Favorites";
      }
      else{
        _selectedPageWidget = _categoriesWidget;
        _pageTitle = "Categories";
      }
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
      ),
      body: _selectedPageWidget,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          )
        ],
        currentIndex: _tabIndex,
        onTap: tabBarOnTap,
      ),
    );
  }
}
