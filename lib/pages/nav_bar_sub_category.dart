import 'package:flutter/material.dart';
import 'package:pos_mobile/pages/ordered_item/ordered_item_screen.dart';
import 'package:pos_mobile/pages/shopping_cart/shopping_cart_screen.dart';
import 'package:pos_mobile/pages/sub_menu_category/sub_menu_category_screen.dart';

class NavBarSubCategory extends StatefulWidget {
  const NavBarSubCategory({Key? key}) : super(key: key);

  @override
  State<NavBarSubCategory> createState() => _NavBarSubCategoryState();
}

class _NavBarSubCategoryState extends State<NavBarSubCategory> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SubMenuCategoryScreen(),
    ShoppingCartScreen(),
    OrderedItemScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          items:  <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_sharp),
              label: 'เมนู',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'ตะกร้าสินค้า',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: 'รายการที่สั่ง',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black87,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }
}
