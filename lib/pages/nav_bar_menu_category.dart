import 'package:flutter/material.dart';
import 'package:pos_mobile/pages/manage_table/manage_table_screen.dart';
import 'package:pos_mobile/pages/menu_category/menu_category_screen.dart';
import 'package:pos_mobile/pages/ordered_item/ordered_item_screen.dart';
import 'package:pos_mobile/pages/sale/sale_screen.dart';
import 'package:pos_mobile/pages/shopping_cart/shopping_cart_screen.dart';
import 'package:pos_mobile/pages/table/table_screen.dart';

class NavBarMenuCategory extends StatefulWidget {
  const NavBarMenuCategory({Key? key, this.index}) : super(key: key);

  final int? index;

  @override
  State<NavBarMenuCategory> createState() => _NavBarMenuCategoryState();
}

class _NavBarMenuCategoryState extends State<NavBarMenuCategory> {
  late int? index = widget.index;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MenuCategoryScreen(),
    SaleScreen(),
    ShoppingCartScreen(),
    OrderedItemScreen(),
    TableScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:
              _widgetOptions.elementAt(index != null ? index! : _selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_sharp),
              label: 'เมนู',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: 'ขาย',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'ตะกร้าสินค้า',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: 'รายการที่สั่ง',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.table_restaurant_rounded),
              label: 'โต๊ะ',
            ),
          ],
          currentIndex: index != null ? index! : _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black87,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int idx) {
    setState(() {
      index = null;
      _selectedIndex = idx;
    });
  }
}
