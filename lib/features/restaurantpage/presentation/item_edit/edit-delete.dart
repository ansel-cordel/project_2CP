import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ItemPage/Forms.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ItemPage/Picture.dart';
import 'package:project_2cp/features/restaurantpage/providers/fetch_menu_items_fr.dart';
import 'package:project_2cp/features/restaurantpage/data/itemmodel.dart';

class EditItemPage extends ConsumerStatefulWidget {
  final MenuItem menuItem; // Changed to receive the full menu item
  const EditItemPage({super.key, required this.menuItem});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ConsumerState<EditItemPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemDescriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  File? selectedImage;
  bool _isLoading = false;

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Pre-populate the form with existing item data
    itemNameController.text = widget.menuItem.name;
    itemDescriptionController.text = widget.menuItem.description;
    priceController.text = widget.menuItem.price.toString();
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  // Edit Menu Item Function
  Future<void> _editMenuItem() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String name = itemNameController.text.trim();
    final String description = itemDescriptionController.text.trim();
    final double? price = double.tryParse(priceController.text.trim());

    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid price')),
      );
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final updateFunction = ref.read(updateMenuItemProvider);
      await updateFunction(
        itemId: widget.menuItem.id,
        name: name,
        description: description,
        price: price,
        isAvailable: true,
      
      );

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context, true); // Success - returns true to indicate refresh needed

    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      print('Error updating item: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update item: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Delete Menu Item Function
  Future<void> _deleteMenuItem() async {
    // Show confirmation dialog first
    final bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: Text('Are you sure you want to delete "${widget.menuItem.name}"? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    // If user cancelled, return early
    if (shouldDelete != true) {
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final deleteFunction = ref.read(deleteMenuItemProvider);
      await deleteFunction(widget.menuItem.id);

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item deleted successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context, true); // Success - returns true to indicate refresh needed

    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      print('Error deleting item: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete item: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Show loading overlay
  Widget _buildLoadingOverlay() {
    if (!_isLoading) return const SizedBox.shrink();
    
    return Container(
      color: Colors.black54,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
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
      appBar: AppBar(
        title: const Text('Edit Item'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: width * 0.08),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.orange[800],
              onPressed: _isLoading ? null : _editMenuItem, // Disable when loading
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              child: SizedBox(
                width: width * 0.35,
                height: width * 0.115,
                child: Center(
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(width: width * 0.03),
            MaterialButton(
              color: Colors.grey[600],
              onPressed: _isLoading ? null : _deleteMenuItem, // Disable when loading
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              child: SizedBox(
                width: width * 0.35,
                height: width * 0.115,
                child: Center(
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  // Add some bottom padding to account for floating action buttons
                  SizedBox(height: width * 0.2),
                ],
              ),
            ),
          ),
          // Loading overlay
          _buildLoadingOverlay(),
        ],
      ),
    );
  }
}