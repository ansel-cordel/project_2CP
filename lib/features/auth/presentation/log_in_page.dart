import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project_2cp/core/widgets/text_field.dart';
import 'package:project_2cp/features/auth/presentation/sign_up_as.dart';

import 'package:project_2cp/features/auth/providers/auth_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/home/presentation/main_home_fr.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/main_orders_fr.dart';
import 'package:project_2cp/features/restaurantpage/presentation/mainpage.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textScale = MediaQuery.of(context).textScaleFactor;

    final loginState = ref.watch(loginResponseProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/pizza.png",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.5),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Welcome!",
              style: GoogleFonts.poppins(
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  )
                ],
                fontSize: screenHeight * 0.04 * textScale,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Sign in to your account:",
              style: GoogleFonts.poppins(
                fontSize: screenHeight * 0.025 * textScale,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormText(
                      hintText: "Email",
                      isPassword: false,
                      controller: _emailController,
                      isEmail: true,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomFormText(
                      hintText: "Password",
                      isPassword: true,
                      controller: _passwordController,
                      isEmail: false,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    GestureDetector(
                      onTap: () async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus(); // Dismiss keyboard
      
      final loginNotifier = ref.read(loginResponseProvider.notifier);
      await loginNotifier.loginUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      final loginResult = ref.read(loginResponseProvider);
      
      if (loginResult.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login failed: ${loginResult.error}"),
          ),
        );
      } else if (loginResult.value != null) {
        // Debug print to verify role value
        print("Navigation role: ${loginResult.value!['role']}");
        
        final role = loginResult.value!['role'].toString().toLowerCase();
        
        if (role == "client") {
          Get.to(() => HomePage());
        } else if (role == "restaurant") {
          Get.to(() => HomePageresto());
        } else if (role == "deliverer") {
          Get.to(() => Deliverer());
        } else {
          // Default case if role doesn't match expected values
          print("Unknown role: $role, defaulting to client view");
          Get.to(() => HomePage());
        }
      }
    }
  },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: double.infinity,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                          color: _isButtonPressed
                              ? Colors.deepOrange.shade300
                              : Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, 3),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        child: loginState.isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                  fontSize: screenHeight * 0.025 * textScale,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "New to our APP ?",
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.025 * textScale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(SignUpAs()),
                  child: Text(
                    "Sign up >",
                    style: GoogleFonts.poppins(
                        fontSize: screenHeight * 0.025 * textScale,
                        fontWeight: FontWeight.w400,
                        color: Colors.deepOrangeAccent),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
