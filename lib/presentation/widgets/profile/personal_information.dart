import 'package:flutter/material.dart';
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
    _nameController.text;
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
      title: 'Personal Information',
      children: [
        EditableField(
          controller: _innController,
          title: 'ИНН',
          isEditable: false,
        ),
        EditableField(
          controller: _birthDateController,
          title: 'Дата Рождения',
          isEditable: false,
        ),
        EditableField(
          controller: _nameController,
          title: 'Имя',
        ),
        EditableField(
          controller: _surnameController,
          title: 'Фамилия',
        ),
        EditableField(
          controller: _patronymicController,
          title: 'Отчество',
        ),
        EditableField(
          controller: _genderController,
          title: 'Пол',
        ),
        EditableField(
          controller: _maritalStatusController,
          title: 'Семейное положение',
        ),
        EditableField(
          controller: _emailController,
          title: 'Электроная почта',
        ),
        EditableField(
          controller: _phoneNumberController,
          title: 'Номер Телефона',
        ),
      ],
    );
  }
}
