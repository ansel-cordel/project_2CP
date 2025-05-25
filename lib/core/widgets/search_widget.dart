import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:project_2cp/features/client/home/data/restaurant_model.dart';
import 'package:project_2cp/features/client/home/providers/fetchingprovider.dart';
import 'package:project_2cp/features/restaurant/main_page.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 215, 215, 215),
      ),
      width: 500,
      height: MediaQuery.of(context).size.height * 0.06,
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          final restaurants = ref.read(restaurantsProvider);
          restaurants.when(
            data: (restaurantList) {
              showSearch(
                context: context,
                delegate: SearchDelegateImpl(
                  restaurants: restaurantList,
                  initialQuery: 'pizza',
                ),
              );
            },
            loading: () {
              // Show loading indicator or fetch restaurants first
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Loading restaurants...')),
              );
            },
            error: (error, stack) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error loading restaurants: $error')),
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Search for restaurants....",
              style: TextStyle(
                color: Color.fromARGB(211, 122, 122, 122),
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Stack(
              children: [
                const Icon(
                  Icons.search,
                  color: Color.fromARGB(211, 122, 122, 122),
                ),
                Positioned(
                  top: -16,
                  right: 3,
                  left: -1,
                  child: Image.asset(
                    'assets/chef.png',
                    height: 40,
                    width: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// SearchDelegate implementation with Restaurant integration
class SearchDelegateImpl extends SearchDelegate<String> {
  final List<Restaurant> restaurants;
  final String initialQuery;

  SearchDelegateImpl({
    required this.restaurants,
    required this.initialQuery,
  }) {
    query = initialQuery;
  }

  List<Restaurant> _filterRestaurants(String query) {
    if (query.isEmpty) return restaurants;
    
    return restaurants.where((restaurant) {
      final nameLower = restaurant.name.toLowerCase();
      final queryLower = query.toLowerCase();
      
      // You can also search by cuisine type, location, etc. if available in your Restaurant model
      // final cuisineLower = restaurant.cuisine?.toLowerCase() ?? '';
      // final locationLower = restaurant.location?.toLowerCase() ?? '';
      
      return nameLower.contains(queryLower);
      // || cuisineLower.contains(queryLower) 
      // || locationLower.contains(queryLower);
    }).toList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Restaurant> suggestions = _filterRestaurants(query);
    
    if (suggestions.isEmpty && query.isNotEmpty) {
      return const Center(
        child: Text(
          'No restaurants found',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final restaurant = suggestions[index];
        return GestureDetector(
          onTap: () => Get.to(restaurant_page(restaurantid: restaurant.id, items: restaurant.items, location: restaurant.address, number: restaurant.phoneNumber, image:"assets/noimage.png", name: restaurant.name)),
          child: SearchResultCard(
            name: restaurant.name,
            resto: restaurant.phoneNumber,
            price: restaurant.address, // You can set delivery fee or average price here
            image: 'assets/noimage.png',
          ),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Restaurant> results = _filterRestaurants(query);
    
    return results.isEmpty
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No restaurants found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final restaurant = results[index];
              return SearchResultCard(
                name: restaurant.name,
                resto: restaurant.phoneNumber ?? 'Restaurant',
                price: restaurant.address, // You can set delivery fee or average price here
                image:  'assets/noimage.png',
              );
            },
          );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }
}

// Styled card for displaying each search result - adapted for restaurants
class SearchResultCard extends StatelessWidget {
  final String name;
  final String resto;  // This will be used for restaurant description or cuisine
  final String price;  // This can be average price or delivery fee
  final String image;

  const SearchResultCard({
    super.key,
    required this.price,
    required this.name,
    required this.resto,
    
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double textScale = screenWidth / 400;

    return Center(
      child: Container(
        height: screenHeight * 0.11,
        width: screenWidth * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      width: screenWidth * 0.2,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: screenWidth * 0.2,
                          height: double.infinity,
                          color: Colors.grey[300],
                          child: const Icon(Icons.restaurant, color: Colors.grey),
                        );
                      },
                    )
                  : Image.asset(
                      image,
                      width: screenWidth * 0.2,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18 * textScale,
                      ),
                    ),
                    Text(
                      resto,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12 * textScale,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16 * textScale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}