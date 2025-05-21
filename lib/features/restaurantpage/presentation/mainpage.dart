import 'package:flutter/material.dart';
import 'package:project_2cp/features/restaurantpage/presentation/MenuScreen/main.menu.dart';
import 'package:project_2cp/features/restaurantpage/presentation/OrderScreen/main.order.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/main.profile.dart';




class HomePageresto extends StatefulWidget {
  const HomePageresto({super.key});

  @override
  State<HomePageresto> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageresto> {
  int _selectedIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    const OrdersScreen(),
    const MenuScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded,size: 25,), label: "Order"),
          BottomNavigationBarItem(icon: Icon(Icons.list,size: 25,), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 25,), label: "Profile"),
        
        ],
      ),
    );
  }
}
