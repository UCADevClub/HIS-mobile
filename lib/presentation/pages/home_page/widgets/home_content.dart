import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/core/mixin/dialog_helper.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_outlined_button.dart';
import 'package:his_mobile/presentation/widgets/home_widgets/content_box.dart';

String medicalPrescription = """
Пациент: [ФИО пациента]
Дата рождения: [Дата рождения пациента]
Адрес: [Адрес пациента]

1. Лекарство: [Название лекарства]
   Дозировка: [Дозировка]
   Способ применения: [Способ применения]
   Количество: [Количество]

2. Лекарство: [Название лекарства]
   Дозировка: [Дозировка]
   Способ применения: [Способ применения]
   Количество: [Количество]

[Другие инструкции или комментарии]

Подпись врача: ______________________
""";

class HomeContent extends StatelessWidget with DialogHelper {
  const HomeContent({super.key});

  void _showPrescriptionDialog(BuildContext context) {
    showMessageDialog(
      context: context,
      message: context.i10n.appointment_to_doctor,
      content: medicalPrescription,
      actions: [
        AppOutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          title: context.i10n.download,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(context.i10n.appointments),
          ),
        ),
        ContentBox(
          description: context.i10n.appointment_to_doctor,
          onTap: () => _showPrescriptionDialog(context),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(context.i10n.appointments),
          ),
        ),
        ContentBox(
          description: context.i10n.appointment_to_doctor,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(context.i10n.appointments),
          ),
        ),
        ContentBox(
          description: context.i10n.appointment_to_doctor,
        ),
      ],
    );
  }
}
