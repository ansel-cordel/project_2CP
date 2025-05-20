import 'package:flutter_riverpod/flutter_riverpod.dart';

// Notifier class to manage the editing state
class EditModeNotifier extends StateNotifier<bool> {
  EditModeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

// Provider to access the EditModeNotifier
final isEditingProvider = StateNotifierProvider<EditModeNotifier, bool>((ref) {
  return EditModeNotifier();
});
