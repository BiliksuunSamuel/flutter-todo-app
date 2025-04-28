import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final Function(TimeOfDay? time)? handleChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTimePicker({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.handleChange,
    this.prefixIcon,
    this.suffixIcon,
  });

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (controller != null) {
        final formattedTime = pickedTime.format(context);
        controller!.text = formattedTime;
      }
      if (handleChange != null) {
        handleChange!(pickedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          if (label != null) const SizedBox(height: 8),
          TextField(
            controller: controller,
            readOnly: true,
            onTap: () => _selectTime(context),
            decoration: InputDecoration(
              hintText: hintText ?? 'Select time',
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0.35, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
