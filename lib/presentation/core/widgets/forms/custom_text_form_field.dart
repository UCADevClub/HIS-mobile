import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.onChanged,
    this.readOnly,
    this.keyboardType,
  });

  final String title;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool? readOnly;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
          child: Text(widget.title),
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: widget.controller,
          onChanged: widget.onChanged ?? (value) {},
          readOnly: widget.readOnly ?? false,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          validator: ,
        ),
      ],
    );
  }
}
