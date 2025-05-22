import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  final TextEditingController itemNameController;
  final TextEditingController itemDescriptionController;
  final TextEditingController priceController;

  const Forms({
    super.key,
    required this.itemNameController,
    required this.itemDescriptionController,
    required this.priceController,
  });

  @override 
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        TextFormField(
          controller: itemNameController,
          decoration: const InputDecoration(
            labelText: "Item Name",
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter item name';
            }
            return null;
          },
        ),
        TextFormField(
          controller: itemDescriptionController,
          decoration: const InputDecoration(
            labelText: "Item Description",
          ),
        ),
        SizedBox(height: width * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Price:",
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: width * 0.4,
              child: TextFormField(
                controller: priceController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "0.00",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter price';
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
