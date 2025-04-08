import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2cp/core/widgets/text_field.dart';
import '../presentation/emailsent.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: ()=> Get.back(),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            centerTitle: true,
            title: const Text(
              'Please Fill Out The Following:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            
            const SizedBox(height: 30),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: CustomFormText(
                    hintText: "Email",
                    isPassword: false,
                    controller: _emailController, // ✅ Pass the controller
                    isEmail: true,
                  ),
                ),
              ),
            
            const SizedBox(height: 20),
            const Text(
              "We will send you an email that will allow you to change the password",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(EmailSent());
                  }
                },
                child: const Text(
                  "Send",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
