import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTimePicker extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final Function(DateTime? dt)? handleChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomDateTimePicker({
    super.key,
    this.label,
    this.hintText,
    this.handleChange,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          if (label != null) SizedBox(height: 8),
          DateTimeField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 0.35, color: Colors.grey),
              ),
            ),
            format: DateFormat("yyyy-MM-dd"),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (handleChange != null) {
                handleChange!(date);
              }
              return date;
            },
          ),
        ],
      ),
    );
  }
}
