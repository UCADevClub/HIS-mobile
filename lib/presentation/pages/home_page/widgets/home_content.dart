import 'package:flutter/material.dart';
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
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text('Записи'),
          ),
        ),
        ContentBox(
          description: 'Записи на прием к врачу',
          onTap: () => showMessageDialog(
            context: context,
            message: 'Запись на прием к врачу',
            content: medicalPrescription,
            actions: [
              AppOutlinedButton(
                onPressed: () {
                  print('Скачать');
                  Navigator.of(context).pop();
                },
                title: 'Скачать',
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            bottom: 10,
          ),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text('Записи'),
          ),
        ),
        ContentBox(
          description: 'Записи на прием к врачу',
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            bottom: 10,
          ),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text('Записи'),
          ),
        ),
        ContentBox(
          description: 'Записи на прием к врачу',
        ),
      ],
    );
  }
}
