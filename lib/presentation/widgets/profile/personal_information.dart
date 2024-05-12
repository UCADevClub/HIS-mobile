import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/presentation/widgets/forms/drop_down_field.dart';
import 'package:his_mobile/presentation/widgets/forms/editable_field.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _innController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _nameController.text = "Рамиль";
    _surnameController.text = "Салихар";
    _patronymicController.text = "Ринатович";
    _innController.text = "123456789012";
    _birthDateController.text = "01.12.1233";
    _genderController.text = "Мужской";
    _maritalStatusController.text = "Женат";
    _emailController.text = "example@gmail.com";
    _phoneNumberController.text = "+7 999 999 99 99";
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropDownField(
      title: context.l10n.personal_information,
      children: [
        EditableField(
          controller: _innController,
          title: context.l10n.inn,
          isEditable: false,
        ),
        EditableField(
          controller: _birthDateController,
          title: context.l10n.date_of_birth,
          isEditable: false,
        ),
        EditableField(
          controller: _nameController,
          title: context.l10n.name,
        ),
        EditableField(
          controller: _surnameController,
          title: context.l10n.surname,
        ),
        EditableField(
          controller: _patronymicController,
          title: context.l10n.patronymic,
        ),
        EditableField(
          controller: _genderController,
          title: context.l10n.gender,
        ),
        EditableField(
          controller: _maritalStatusController,
          title: context.l10n.marital_status,
        ),
        EditableField(
          controller: _emailController,
          title: context.l10n.email,
        ),
        EditableField(
          controller: _phoneNumberController,
          title: context.l10n.phone_number,
        ),
      ],
    );
  }
}
