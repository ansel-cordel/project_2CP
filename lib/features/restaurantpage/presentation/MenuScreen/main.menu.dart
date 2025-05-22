import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ItemPage/main_ItemPage.dart';
import 'package:project_2cp/features/restaurantpage/presentation/MenuScreen/item_widget.dart';
import 'package:project_2cp/features/restaurantpage/presentation/search/search_bar.dart';
import 'package:project_2cp/features/restaurantpage/providers/fetch_menu_items_fr.dart';


class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemsAsync = ref.watch(menuItemsProvider);

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.height * 0.01,
          MediaQuery.of(context).size.height * 0.063,
          MediaQuery.of(context).size.height * 0.01,
          MediaQuery.of(context).size.height * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              search(),
              menuItemsAsync.when(
                data: (items) => Column(
                  children: items.map((item) {
                    return Column(
                      children: [
                        Item(
                          Rate: 3,
                          ItemName: item.name,
                          ItemPicture: "",
                          ItemDescription: item.description,
                          Price: item.price,
                          id: item.id,
                          isAvailable:item.isAvailable,
                          TotalOrders: 500,
                        ),
                        Text(
                          "_________________",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Text(
                    "Error loading menu items",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
        ),
        onPressed: () async {
          final added = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ItemPage()),
          );
          if (added == true) {
            ref.invalidate(menuItemsProvider);
          }
        },
        backgroundColor: Colors.orange[800],
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: MediaQuery.of(context).size.width * 0.07,
        ),
      ),
    );
  }
}
