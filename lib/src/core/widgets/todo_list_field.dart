import 'package:flutter/material.dart';

import '../helpers/form_helper.dart';
import '../theme/app_colors.dart';

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
    final defualtBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColor.primaryColor),
    );
    return TextFormField(
      controller: controller,
      onTapOutside: (_) => context.unfocus(),
      validator: validator,
      focusNode: focusNode,
      cursorColor: AppColor.primaryColor,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 15,
          color: AppColor.black,
        ),
        isDense: true,
        border: defualtBorder,
        enabledBorder: defualtBorder,
        focusedBorder: defualtBorder,
        errorBorder: defualtBorder.copyWith(
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
