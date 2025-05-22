import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:project_2cp/features/restaurantpage/presentation/MenuScreen/main.menu.dart';

class Picture extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onPickImage;

  const Picture({
    super.key,
    required this.selectedImage,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: width * 0.8,
      width: width,
      child: Stack(
        children: [
          SizedBox(
            height: width * 0.8,
            width: width,
            child: selectedImage != null
                ? Image.file(selectedImage!, fit: BoxFit.cover)
                : Container(
                    color: Colors.grey[300],
                    child: const Center(child: Text("No image selected")),
                  ),
          ),
          Positioned(
            bottom: width * 0.02,
            right: width * 0.02,
            child: SizedBox(
              height: width*0.1,
              width: width*0.1,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.1),
                ),
                backgroundColor: const Color.fromARGB(113, 251, 138, 0),
                onPressed: onPickImage,
                child: Icon(
                  Icons.edit_outlined,
                  size: width * 0.06,
                  color: Colors.orange[800],
                ),
              ),
            ),
          ),
          Positioned(
            top: width * 0.02,
            left: width * 0.02,
            child: SizedBox(
              height: width*0.06,
              width: width*0.1,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                backgroundColor: const Color.fromARGB(133, 251, 138, 0),
                onPressed:(){
                  Navigator.pop(context); 
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: width * 0.04,
                  color: Colors.orange[800],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
