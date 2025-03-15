import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_as_provider.g.dart';

@riverpod
class ToggleNotifier extends _$ToggleNotifier { 
  @override
  String? build() => null; 

  void toggle(String option) {
    state = option;
  }
}
