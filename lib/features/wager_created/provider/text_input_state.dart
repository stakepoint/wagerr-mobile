/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/theme/app_colors.dart';

class TextInputState {
  final BuildContext context;
  final String text;
  final Color color;

  TextInputState({required this.context, required this.text, required this.color});
}

class TextInputNotifier extends StateNotifier<TextInputState> {
  TextInputNotifier()
      : super(TextInputState(context: state.context, text: '', color: AppColors.buttonInActiveColor));

  void updateText(String newText) {
    if (newText.length > 14) {
      state = TextInputState(text: newText, color: AppColors.buttonColor);
    } else {
      state =
          TextInputState(text: newText, color: AppColors.buttonInActiveColor);
    }
  }
}

final textInputProvider =
    StateNotifierProvider<TextInputNotifier, TextInputState>((ref) {
  return TextInputNotifier();
});
*/
