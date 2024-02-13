import 'package:flutter/material.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const TodoListField({
    super.key,
    required this.label,
    this.keyboardType,
    this.focusNode,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
        isDense: true,
      ),
    );
  }
}
