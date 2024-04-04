import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_bloc.dart';

class EditableField extends StatefulWidget {
  final String title;
  final bool isEditable;
  final TextEditingController controller;

  const EditableField({
    Key? key,
    required this.title,
    this.isEditable = true,
    required this.controller,
  }) : super(key: key);

  @override
  State<EditableField> createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  @override
  Widget build(BuildContext context) {
    bool isEditable = false;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoUpdating) {
            isEditable = state.isUpdating;
          }
          return SizedBox(
            child: (isEditable && widget.isEditable)
                ? Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.title,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: widget.controller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        maxLines: null,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        widget.isEditable ? Icons.edit : null,
                        color: theme.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.end,
                          controller: widget.controller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
