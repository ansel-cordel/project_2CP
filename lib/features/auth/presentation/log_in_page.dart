import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:project_2cp/core/widgets/text_field.dart';
import 'package:project_2cp/features/auth/presentation/sign_up_as.dart'; // Import the signup screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isButtonPressed = false; // Moved to correct place

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textScale = MediaQuery.of(context).textScaleFactor; // Fixed syntax error

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image with Gradient Overlay
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

            // Welcome Text
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
                    SizedBox(height: screenHeight * 0.03),

                    // Login Button with GestureDetector
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isButtonPressed = true;
                          });

                          // Delay before resetting button color
                          Future.delayed(Duration(milliseconds: 300), () {
                            setState(() {
                              _isButtonPressed = false;
                            });
                          });

                          // TODO: Add authentication logic here
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(4, 4),
                            ),
                          ],
                          color: _isButtonPressed ? Colors.white : Color(0xFFFF7700),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFFFF7700), width: 2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: screenHeight * 0.03 * textScale,
                            color: _isButtonPressed ? Color(0xFFFF7700) : Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    // Forgot Password
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            )
                          ],
                          color: Color(0xFFFF7700),
                          fontSize: screenHeight * 0.022 * textScale,
                        ),
                      ),
                    ),

                    // Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New to our App?",
                          style: TextStyle(fontSize: screenHeight * 0.025 * textScale),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => SignUpAs(), transition: Transition.rightToLeft); // Use GetX for navigation
                          },
                          child: Text(
                            "Sign Up >",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                )
                              ],
                              fontSize: screenHeight * 0.024 * textScale,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
