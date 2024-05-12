import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
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
        title: Text(context.l10n.medical_data),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            EditableField(
              title: context.l10n.blood_type,
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: context.l10n.glasses_for_vision,
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: context.l10n.allergies,
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: context.l10n.vaccinations,
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: context.l10n.taking_medications,
              controller: _bloodGroupController,
              isEditable: false,
            ),
            _lineBreak(),
            EditableField(
              title: context.l10n.medical_condition,
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
