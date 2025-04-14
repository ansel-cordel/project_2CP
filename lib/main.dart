import 'package:flutter/material.dart';
import 'package:project_2cp/features/home/presentation/main_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:project_2cp/features/orderhisyory/presentation/orderhistory.dart';
import 'package:project_2cp/features/orderlist/presentation/orderlistpage.dart';
import 'package:project_2cp/features/profile/presentation/main_profile.dart';
import 'features/auth/presentation/log_in_page.dart';
import 'features/auth/presentation/sign_up.dart';
import 'features/auth/presentation/sign_up_as.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/signupas', page: () => SignUpAs()),
      ],
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

 
  final List<Widget> _pages = [
    const HomeScreen(),
    const OrderListPage(),
    const OrderHistoryPage(),
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
      body: _pages[_selectedIndex], // Show selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant,size: 25,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded,size: 25,), label: "Order"),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined,size: 25,), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 25,), label: "Profile"),
        ],
      ),
    );
  }
}
