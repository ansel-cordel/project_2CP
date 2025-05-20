import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/providers/toggleprovider.dart';
// Replace with actual path

class EditButton extends ConsumerStatefulWidget {
  const EditButton({super.key});

  @override
  _EditButtonState createState() => _EditButtonState();
}

class _EditButtonState extends ConsumerState<EditButton> {
  @override
  Widget build(BuildContext context) {
    final isEditing = ref.watch(isEditingProvider);

    return MaterialButton(
      onPressed: () {
        ref.read(isEditingProvider.notifier).toggle();
      },
      color: isEditing ? Colors.deepOrange.shade600 : Colors.orange.shade700,
      height: MediaQuery.of(context).size.height * 0.08,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      
      child: Center(
        child: Text(
          isEditing ? "Confirm" : "Edit",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
