import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.lines,
    this.keyboardType = TextInputType.text,
    this.required = false,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final int? lines;
  final TextInputType keyboardType;
  final bool required;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: label,
          hintText: hint ?? label,
          filled: true,
          fillColor: const Color(0xFF171B2D),
        ),
        minLines: lines,
        maxLines: lines,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            String message = "$label is required";
            return message;
          }
          return null;
        },
      ),
    );
  }
}
