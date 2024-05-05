import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/presentation/widgets/forms/editable_field.dart';

@RoutePage()
class MedicalDataPage extends StatefulWidget {
  const MedicalDataPage({super.key});

  @override
  State<MedicalDataPage> createState() => _MedicalDataPageState();
}

class _MedicalDataPageState extends State<MedicalDataPage> {
  final TextEditingController _bloodGroupController =
      TextEditingController(text: 'Раздражение, зуд, отеки, высыпания');

  @override
  void dispose() {
    _bloodGroupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Data'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            EditableField(
              title: 'Группа Крови',
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: 'Очки для Зрения',
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: 'Аллергии',
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: 'Вакцины',
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: 'Принимаемые лекарства',
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: 'Медицинское состояние',
              controller: _bloodGroupController,
              isEditable: false,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _lineBreak() {
  return const Padding(
    padding: EdgeInsets.only(
      left: 16.0,
      right: 16.0,
      top: 8.0,
      bottom: 8.0,
    ),
    child: Divider(
      thickness: 1.5,
      color: Colors.grey,
    ),
  );
}
