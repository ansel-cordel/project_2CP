import 'package:flutter/material.dart';

class PersonalInfo_text extends StatelessWidget {
  const PersonalInfo_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Personal Info",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: Colors.brown.shade800,
            shadows: [
              Shadow(
                color: Colors.orange.shade100.withOpacity(0.6),
                offset: const Offset(1, 1),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PersonalInfo extends StatefulWidget {
  final bool isEditing;
  const PersonalInfo({super.key, required this.isEditing});

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> with SingleTickerProviderStateMixin {
  late TextEditingController nameController;
  late TextEditingController zoneController;
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "Your name");
    zoneController = TextEditingController(text: "Working zone");
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    if (widget.isEditing) {
      _animController.forward();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    zoneController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PersonalInfo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isEditing && !oldWidget.isEditing) {
      _animController.forward();
    } else if (!widget.isEditing && oldWidget.isEditing) {
      _animController.reverse();
    }
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.brown.shade400, fontWeight: FontWeight.w400),
      filled: true,
      fillColor: Colors.orange.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.orange.shade300),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.brown.shade700, width: 2),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.brown.shade800,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  Widget _buildTextFieldOrText(String label, TextEditingController controller, String hint) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLabel(label),
        Expanded(
          child: widget.isEditing
              ? FadeTransition(
                  opacity: _animController,
                  child: TextField(
                    controller: controller,
                    decoration: _inputDecoration(hint),
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.brown.shade800, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    controller.text,
                    style: TextStyle(
                      color: Colors.brown.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.shade200.withOpacity(0.4),
              offset: const Offset(3, 5),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(color: Colors.orange.shade300, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextFieldOrText("Your Name:", nameController, "Enter your name"),
            const SizedBox(height: 16),
            _buildTextFieldOrText("Working Zone:", zoneController, "Enter working zone"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit password",
                  style: TextStyle(
                    color: Colors.brown.shade800,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 5,
                    shadowColor: Colors.orange.shade200,
                  ),
                  onPressed: () {
                    // TODO: Implement password edit logic
                  },
                  child: const Icon(Icons.edit_outlined, size: 24, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
