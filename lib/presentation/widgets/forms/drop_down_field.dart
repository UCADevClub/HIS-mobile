import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            title: Text(
              widget.title,
              style: theme.textTheme.headlineLarge,
            ),
            trailing: IconButton(
              icon: Icon(
                showDetails
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onPressed: () {
                setState(() {
                  showDetails = !showDetails;
                });
              },
            ),
          ),
        ),
        if (showDetails)
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: widget.child,
          ),
      ],
    );
  }
}
