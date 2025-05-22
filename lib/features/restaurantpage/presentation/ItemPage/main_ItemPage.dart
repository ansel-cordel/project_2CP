import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_2cp/features/restaurantpage/providers/fetch_menu_items_fr.dart';
import 'Forms.dart';
import 'Picture.dart';

class ItemPage extends ConsumerStatefulWidget {
  const ItemPage({super.key});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ConsumerState<ItemPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemDescriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  bool showTwoButtons = false;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

  if (selectedImage == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select an image')),
    );
    return;
  }

  final String name = itemNameController.text.trim();
  final String description = itemDescriptionController.text.trim();
  final double? price = double.tryParse(priceController.text.trim());

  if (price == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter a valid price')),
    );
    return;
  }

    try {
      // This line remains exactly the same - it now uses the updated MenuService
      final service = ref.read(menuServiceProvider);
      await service.addMenuItem(
        name: name,
        description: description,
        price: price,
        image: selectedImage!,
      );
      
      itemNameController.clear();
      itemDescriptionController.clear();
      priceController.clear();
      setState(() {
        selectedImage = null;
      });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item added successfully!')),
    );

      Navigator.pop(context, true); // Success - this will refresh the MenuScreen
    } catch (e) {
      print('Error adding item: $e'); // Added more descriptive error logging
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed to add item"),
      ));
    }
  }

  @override
  void dispose() {
    itemNameController.dispose();
    itemDescriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: width * 0.08),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!showTwoButtons)
              MaterialButton(
                color: Colors.orange[800],
                onPressed: () {
                  setState(() {
                    showTwoButtons = true;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: SizedBox(
                  width: width * 0.83,
                  height: width * 0.115,
                  child: Center(
                    child: Text(
                      "Add Item",
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            if (showTwoButtons) ...[
              MaterialButton(
                color: Colors.orange[800],
                onPressed: () {
                  print("Add Dish tapped");
                  // You can replace this with actual logic
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: SizedBox(
                  width: width * 0.35,
                  height: width * 0.115,
                  child: Center(
                    child: Text(
                      "confirm",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width*0.03),
              MaterialButton(
                color: Colors.grey[600],
                onPressed: () {
                  print("Add Drink tapped");
                  // You can replace this with actual logic
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: SizedBox(
                  width: width * 0.35,
                  height: width * 0.115,
                  child: Center(
                    child: Text(
                      "delete",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: width * 0.1),
          child: Column(
            children: [
              Picture(
                selectedImage: selectedImage,
                onPickImage: pickImage,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: width * 0.03,
                ),
                child: Form(
                  key: _formKey,
                  child: Forms(
                    itemNameController: itemNameController,
                    itemDescriptionController: itemDescriptionController,
                    priceController: priceController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
