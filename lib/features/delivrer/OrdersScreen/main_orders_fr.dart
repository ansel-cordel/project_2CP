import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:project_2cp/core/providers/navigationprovider.dart';


import 'package:project_2cp/features/delivrer/HistoryScreen/main_history.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/main_orders.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/main_profile.dart';


class Deliverer extends ConsumerStatefulWidget {
  const Deliverer({super.key});

  @override
  ConsumerState<Deliverer> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<Deliverer> {
  final List<Widget> _pages = [
 
    const DelivererOrderScreen(),
     const HistoryScreen(),
     const DelivererProfileScreen(),
    
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
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined, size: 25),
            label: "Profile",
          ),
         
        ],
      ),
    );
  }
}
