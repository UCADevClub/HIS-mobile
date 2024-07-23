import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/presentation/widgets/forms/drop_down_field.dart';
import 'package:his_mobile/presentation/widgets/forms/editable_field.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.patronymicController,
    required this.innController,
    required this.birthDateController,
    required this.genderController,
    required this.maritalStatusController,
    required this.emailController,
    required this.phoneNumberController,
  });

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController patronymicController;
  final TextEditingController innController;
  final TextEditingController birthDateController;
  final TextEditingController genderController;
  final TextEditingController maritalStatusController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return DropDownField(
      title: context.l10n.personal_information,
      child: Column(
        children: [
          EditableField(
            controller: widget.innController,
            title: context.l10n.inn,
            isEditable: false,
          ),
          EditableField(
            controller: widget.birthDateController,
            title: context.l10n.date_of_birth,
            isEditable: false,
          ),
          EditableField(
            controller: widget.nameController,
            title: context.l10n.name,
          ),
          EditableField(
            controller: widget.surnameController,
            title: context.l10n.surname,
          ),
          EditableField(
            controller: widget.patronymicController,
            title: context.l10n.patronymic,
          ),
          EditableField(
            controller: widget.genderController,
            title: context.l10n.gender,
          ),
          EditableField(
            controller: widget.maritalStatusController,
            title: context.l10n.marital_status,
          ),
          EditableField(
            controller: widget.emailController,
            title: context.l10n.email,
          ),
          EditableField(
            controller: widget.phoneNumberController,
            title: context.l10n.phone_number,
          ),
        ],
      ),
    );
  }
}
