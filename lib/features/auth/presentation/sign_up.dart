import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2cp/features/auth/presentation/sign_up_as.dart';
import 'package:project_2cp/core/widgets/text_field.dart';
import 'package:project_2cp/features/auth/presentation/congratulations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/auth/providers/signup.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/food_types.dart/type.dart';
import 'package:project_2cp/features/auth/providers/signup.dart';
class SignUpScreen extends ConsumerStatefulWidget {
  final String role;
  const SignUpScreen({super.key, required this.role});

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

  String? _selectedZone;
  String? _selectedVehicleType;

  final List<String> _zones = [
    'Adrar',
    'Chlef',
    'Laghouat',
    'Oum El Bouaghi',
    'Batna',
    'Béjaïa',
    'Biskra',
    'Béchar',
    'Blida',
    'Bouira',
    'Tamanrasset',
    'Tébessa',
    'Tlemcen',
    'Tiaret',
    'Tizi Ouzou',
    'Algiers',
    'Djelfa',
    'Jijel',
    'Sétif',
    'Saïda',
    'Skikda',
    'Sidi Bel Abbès',
    'Annaba',
    'Guelma',
    'Constantine',
    'Médéa',
    'Mostaganem',
    'MSila',
    'Mascara',
    'Ouargla',
    'Oran',
    'El Bayadh',
    'Illizi',
    'Bordj Bou Arreridj',
    'Boumerdès',
    'El Tarf',
    'Tindouf',
    'Tissemsilt',
    'El Oued',
    'Khenchela',
    'Souk Ahras',
    'Tipaza',
    'Mila',
    'Aïn Defla',
    'Naâma',
    'Aïn Témouchent',
    'Ghardaïa',
    'Relizane',
    'Timimoun',
    'Bordj Badji Mokhtar',
    'Ouled Djellal',
    'Béni Abbès',
    'In Salah',
    'In Guezzam',
    'Touggourt',
    'Djanet',
    'El M`Ghair',
    'El Menia'
  ];

  final List<String> _vehicleTypes = ['Bike', 'Car', 'Motorcycle', 'Van'];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    if (widget.role == 'Deliverer') {
      if (_selectedZone == null || _selectedVehicleType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text("Please select both working zone and vehicle type")),
        );
        return;
      }
    }

    try {
      final phoneNumber = int.tryParse(_phoneNumberController.text);
      if (phoneNumber == null) {
        throw Exception("Please enter a valid phone number");
      }

      if (widget.role == 'Deliverer') {
        // Use deliverer registration provider
        await ref
            .read(registerDelivererResponseProvider.notifier)
            .registerDeliverer(
              username: _emailController.text,
              phoneNumber: phoneNumber,
              name: _nameController.text,
              lastName: "_lastNameController.text",
              password: _passwordController.text,
              email: _emailController.text,
              workingZone: _selectedZone!,
              vehicleType: _selectedVehicleType!,
            );
      } else {
        // Use regular registration provider
        await
ref.read(registerResponseProvider.notifier).register(
              username: _emailController.text,
              phoneNumber: phoneNumber,
              name: _nameController.text,
              lastName: "_lastNameController.text",
              password: _passwordController.text,
              email: _emailController.text,
              address: "_addressController.text",
              role: widget.role,
            );
      }

      Get.to(() => Congratulations(), transition: Transition.rightToLeft);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  if (widget.role == 'Deliverer') ...[
                    SizedBox(height: screenHeight * 0.045),
                    Text("Working Zone",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButtonFormField<String>(
                      value: _selectedZone,
                      items: _zones.map((zone) {
                        return DropdownMenuItem(
                          value: zone,
                          child: Text(zone),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedZone = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                            vertical: screenWidth * 0.03),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.04),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                      validator: (value) =>
                          value == null ? 'Please select a working zone' : null,
                    ),
                    SizedBox(height: screenHeight * 0.045),
                    Text("Vehicle Type",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButtonFormField<String>(
                      value: _selectedVehicleType,
                      items: _vehicleTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedVehicleType = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                            vertical: screenWidth * 0.03),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.04),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                      validator: (value) =>
                          value == null ? 'Please select a working zone' : null,
                    ),
                  ],
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _submitForm,
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