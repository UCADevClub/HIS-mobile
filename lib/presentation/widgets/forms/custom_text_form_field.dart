import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.onChanged,
    this.readOnly,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.height,
    this.width,
  });

  final String title;
  final TextEditingController controller;
  final String? hintText;
  final Function(String)? onChanged;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final double? width;
  final double? height;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? hideText;

  @override
  void initState() {
    hideText = widget.obscureText;
    super.initState();
  }

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
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          width: widget.width ?? 300,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              hintText: widget.hintText ?? '',
              hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.grey,
                  ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(context.dimens.borderRadius),
              ),
              suffixIcon: widget.obscureText == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          hideText = !hideText!;
                        });
                      },
                      icon: Icon(
                        hideText == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    )
                  : null,
              errorMaxLines: 2,
            ),
            obscureText: hideText!,
            controller: widget.controller,
            onChanged: widget.onChanged ?? (value) {},
            readOnly: widget.readOnly ?? false,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
