import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:project_2cp/features/restaurantpage/data/itemmodel.dart';


class MenuItemService {
  final String baseUrl = 'http://localhost:8000/api/restaurant/123/menu/items/';

  Future<List<MenuItem>> fetchMenuItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => MenuItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }

  Future<void> addMenuItem({
    required String name,
    required String description,
    required double price,
    required File image,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price.toString();

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      image.path,
      filename: basename(image.path),
    ));

    final response = await request.send();
    if (response.statusCode != 201) {
      throw Exception('Failed to add menu item');
    }
  }
}
