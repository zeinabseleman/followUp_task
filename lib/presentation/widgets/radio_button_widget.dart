import 'package:flutter/material.dart';
import 'custom_text.dart';

class RadioButtonWidget extends StatelessWidget {
  final String value;
  final String selectedStatus;
  final ValueChanged<String> onChanged;

  const RadioButtonWidget({
    super.key,
    required this.value,
    required this.selectedStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String?>(
      title: CustomText(text: value),
      value: value,
      groupValue: selectedStatus,
      onChanged: (val) {
        if (val != null) {
          onChanged(val);
        }
      },
    );
  }
}
