import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2cp/features/auth/presentation/sign_up.dart';
import 'package:project_2cp/features/auth/presentation/log_in_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/sign_up_as_provider.dart';

class SignUpAs extends ConsumerWidget {
  const SignUpAs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final selectedOption = ref.watch(toggleNotifierProvider); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.to(() =>  LoginScreen(), transition: Transition.leftToRight);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text(
          'I want to sign up as a:',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double imageSize = constraints.maxWidth * 0.2;
          double titleFontSize = constraints.maxWidth * 0.05;
          double textFontSize = constraints.maxWidth * 0.035;
          double horizontalPadding = constraints.maxWidth * 0.05;

          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: 20, horizontal: horizontalPadding),
            child: Column(
              children: [
                Expanded(
                  child: buildOption(
                    ref: ref, // Fixed: Pass ref
                    title: "A Client",
                    description:
                        "Find a selection of the many menus we offer with the restaurants that are signed up in our app!",
                    imagePath: "assets/client.png",
                    imageSize: imageSize,
                    titleFontSize: titleFontSize,
                    textFontSize: textFontSize,
                    isSelected: selectedOption == "Client",
                    optionType: "Client",
                  ),
                ),
                Expanded(
                  child: buildOption(
                    ref: ref,
                    title: "A Restaurant",
                    description:
                        "Advertise your food and get new clients from all around town ordering from you!",
                    imagePath: "assets/resto.png",
                    imageSize: imageSize,
                    titleFontSize: titleFontSize,
                    textFontSize: textFontSize,
                    isSelected: selectedOption == "Restaurant",
                    optionType: "Restaurant",
                  ),
                ),
                Expanded(
                  child: buildOption(
                    ref: ref,
                    title: "A Deliverer",
                    description:
                        "Join our team of talented deliverers and work as a part-timer with us!",
                    imagePath: "assets/deliv.png",
                    imageSize: imageSize,
                    titleFontSize: titleFontSize,
                    textFontSize: textFontSize,
                    isSelected: selectedOption == "Deliverer",
                    optionType: "Deliverer",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (selectedOption != null) {
                        Get.to(() => const SignUpScreen(),
                            transition: Transition.rightToLeft);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please choose your sign-up method"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Next >",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w400,
                        color: selectedOption != null
                            ? const Color(0xFFFF7700)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
   Widget buildOption({
    required WidgetRef ref,
    required String title,
    required String description,
    required String imagePath,
    required double imageSize,
    required double titleFontSize,
    required double textFontSize,
    required bool isSelected,
    required String optionType,
  }) {
    return Material(
      color: isSelected ? const Color(0x66FF9263) : Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => ref.read(toggleNotifierProvider.notifier).toggle(optionType),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 16, horizontal: imageSize * 0.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24, right: 24),
                child: Image.asset(imagePath,
                    width: imageSize,
                    height: imageSize * 1.1,
                    fit: BoxFit.fill),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize)),
                    const SizedBox(height: 8),
                    Text(description,
                        style: TextStyle(
                            fontSize: textFontSize,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
