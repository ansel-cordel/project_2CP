import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2cp/features/auth/presentation/sign_up_as.dart';
import 'package:project_2cp/core/widgets/text_field.dart';
import 'package:project_2cp/features/auth/presentation/congratulations.dart';
//import 'package:project_2cp/features/auth/providers/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final state = ref.watch(registerResponseProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.to(() => const SignUpAs(),
                    transition: Transition.leftToRight);
              },
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.04),
                  CustomFormText(
                    hintText: "Name",
                    isPassword: false,
                    controller: _nameController,
                    isEmail: false,
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  CustomFormText(
                    hintText: "Email",
                    isPassword: false,
                    controller: _emailController,
                    isEmail: true,
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  CustomFormText(
                    hintText: "Phone Number",
                    isPassword: false,
                    controller: _phoneNumberController,
                    isEmail: false,
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  CustomFormText(
                    hintText: "Password",
                    isPassword: true,
                    controller: _passwordController,
                    isEmail: false,
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  CustomFormText(
                    hintText: "Confirm Password",
                    isPassword: true,
                    controller: _confirmPasswordController,
                    isEmail: false,
                  ),
                  SizedBox(height: screenHeight * 0.045),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                         /*
                         this is sign up logic
                          state.when(
                            data: (_) {
                              Get.to(() => Congratulations(),
                                  transition: Transition.rightToLeft);
                            },
                            error: (err, stack) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error: $err"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            loading: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          );
                         */
                          Get.to(() => Congratulations(),
                                  transition: Transition.rightToLeft);
                             
                          } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Please fill out all fields correctly"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          "Next >",
                          style: TextStyle(
                            color: Color(0xFFFF7700),
                            fontSize: screenWidth * 0.07,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
