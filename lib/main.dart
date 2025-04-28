import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:project_2cp/core/providers/navigationprovider.dart';
import 'package:project_2cp/features/client/home/presentation/main_home.dart';
import 'package:project_2cp/features/client/orderhisyory/presentation/orderhistory.dart';
import 'package:project_2cp/features/client/orderlist/presentation/orderlistpage.dart';
import 'package:project_2cp/features/client/profile/presentation/main_profile.dart';

import 'features/auth/presentation/log_in_page.dart';
import 'features/auth/presentation/sign_up.dart';
import 'features/auth/presentation/sign_up_as.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
        GetPage(name: '/signupas', page: () => const SignUpAs()),
      ],
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const OrderListPage(),
    const OrderHistoryPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) =>
            ref.read(bottomNavIndexProvider.notifier).state = index,
        selectedItemColor: Colors.orange[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant, size: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded, size: 25),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined, size: 25),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 25),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
