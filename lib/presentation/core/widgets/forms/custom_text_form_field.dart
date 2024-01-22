import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.onChanged,
    this.readOnly,
    this.keyboardType,
    this.validator,
  });

  final String title;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 7.5,
          ),
          child: Text(title),
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: controller,
          onChanged: onChanged ?? (value) {},
          readOnly: readOnly ?? false,
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
        ),
      ],
    );
  }
}
