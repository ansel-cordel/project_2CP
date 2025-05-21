import 'package:project_2cp/features/client/orderlist/data/ordermodel.dart';

class Restaurant {
  final String id;
  final String name;
  final List<Item> items;
  final String Specialities;
  final String number;
  final String WorkingHours;
  

  Restaurant({
    required this.Specialities,
    required this.number,
    required this.WorkingHours,

    required this.id,
    required this.name,
    required this.items,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'].toString(),
      Specialities : json['Specialities'],
      WorkingHours: json['WorkingHours'],
      number: json['number'],
      name:  json['name'],
      items: (json['items'] as List)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
    );
  }
}
