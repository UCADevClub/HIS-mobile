import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/widgets/forms/drop_down_field.dart';
import 'package:his_mobile/presentation/widgets/forms/editable_field.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({super.key});

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _nameController.text = 'Рамиль';
    _surnameController.text = 'Салихар';
    _patronymicController.text = 'Шамильевич';
    _phoneNumberController.text = '+996 555 555 555';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _patronymicController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropDownField(
      title: 'Emergency Contact',
      children: [
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
          controller: _phoneNumberController,
          title: 'Номер Телефона',
        ),
      ],
    );
  }
}
