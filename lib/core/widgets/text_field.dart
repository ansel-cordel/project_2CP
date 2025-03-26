import 'package:flutter/material.dart';

class CustomFormText extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final bool isEmail;

  const CustomFormText({
    super.key,
    required this.isEmail,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  });

  @override
  State<CustomFormText> createState() => _CustomFormTextState();
}

class _CustomFormTextState extends State<CustomFormText> {
  late FocusNode _focusNode;
  bool isFocused = false;
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus || widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            focusNode: _focusNode,
            controller: widget.controller,
            obscureText: isObscure,
            keyboardType: widget.isPassword
                ? TextInputType.visiblePassword
                : widget.isEmail
                    ? TextInputType.emailAddress
                    : TextInputType.text,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              filled: true,
              fillColor: Color(0xFFE8E8E8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your ${widget.hintText}";
              }

              if (widget.isEmail) {
                String emailPattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                if (!RegExp(emailPattern).hasMatch(value)) {
                  return "Enter a valid email address";
                }
              }

              if (widget.hintText.toLowerCase().contains("phone")) {
                String phonePattern = r'^\d{10,15}$';
                if (!RegExp(phonePattern).hasMatch(value)) {
                  return "Enter a valid phone number (10-15 digits)";
                }
              }

              if (widget.isPassword) {
                if (value.length < 8) {
                  return "Password must be at least 8 characters long";
                }
                if (!RegExp(r'[A-Za-z]').hasMatch(value) ||
                    !RegExp(r'[0-9]').hasMatch(value)) {
                  return "Password must contain letters and numbers";
                }
                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                  return "Password must contain at least one special character";
                }
              }

              return null;
            },
          ),
        ),

        // Password Visibility Toggle
        if (widget.isPassword)
          Positioned(
            right: 20,
            top: 10,
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: widget.controller,
              builder: (context, value, child) {
                return value.text.isNotEmpty
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Text(isObscure ? "Show" : "Hide",style: TextStyle(fontSize: 18, color: Color(0xFF949494),fontWeight: FontWeight.w400),),
                      )
                    : SizedBox(); // Hide button when empty
              },
            ),
          ),

        // Animated Hint Text
        Positioned(
          left: 16,
          top: isFocused ? 4 : 22, // Moves up when focused
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300), // Smooth transition
            style: TextStyle(
              fontSize: isFocused ? 12 : 16,
              color:  Colors.grey[400],
              fontWeight: FontWeight.w500,
            ),
            child: Text(widget.hintText),
          ),
        ),
      ],
    );
  }
}
