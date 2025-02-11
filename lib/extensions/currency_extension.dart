import 'package:flutter/services.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  static const double _maxValue = 10000000.00;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (text.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }
    double value = int.parse(text) / 100;
    if (value > _maxValue) {
      return oldValue;
    }
    String formattedValue = value.toStringAsFixed(2);
    final parts = formattedValue.split('.');
    final wholePart = parts[0];
    final decimalPart = parts[1];

    final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final result = wholePart.replaceAllMapped(regex, (match) => '${match[1]},');
    text = '\$$result.$decimalPart';

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
