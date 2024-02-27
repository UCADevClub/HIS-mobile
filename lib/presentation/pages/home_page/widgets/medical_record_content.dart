import 'package:flutter/material.dart';
import 'package:his_mobile/core/mixin/dialog_helper.dart';
import 'package:his_mobile/presentation/widgets/buttons/app_outlined_button.dart';
import 'package:his_mobile/presentation/widgets/layout/swipe_bar.dart';

String medicalReport = """
Пациент: John Doe
Дата рождения: 01/01/1990
Дата анализа: 02/15/2024

1. Клинический анализ крови:
   - Гемоглобин: [Значение]
   - Эритроциты: [Значение]
   - Лейкоциты: [Значение]
   - Тромбоциты: [Значение]

2. Биохимический анализ крови:
   - Общий белок: [Значение]
   - Глюкоза: [Значение]
   - Холестерин: [Значение]
   - Креатинин: [Значение]

3. Анализ мочи:
   - Цвет: [Значение]
   - Плотность: [Значение]
   - Белок: [Значение]
   - Глюкоза: [Значение]

4. Электрокардиограмма (ЭКГ):
   - Ритм: [Значение]
   - Частота сердечных сокращений: [Значение]
   - Электрическая ось сердца: [Значение]

[Другие результаты и комментарии врача]

Врач: Dr. Smith
""";

class MedicalRecordContent extends StatelessWidget with DialogHelper {
  const MedicalRecordContent({super.key});

  @override
  Widget build(BuildContext context) {
    final _tabController = TabController(
      length: 2,
      vsync: Scaffold.of(context),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SwipeBar(
            tabController: _tabController,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Expanded(
                //   child: ListView(
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           showMessageDialog(
                //             message: 'Короткий Анализ',
                //             content: 'Короткий анализ пациента',
                //             context: context,
                //           );
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(30),
                //             gradient: LinearGradient(
                //               begin: Alignment.topLeft,
                //               end: Alignment.bottomRight,
                //               colors: [
                //                 Colors.blue,
                //                 Colors.yellow,
                //               ],
                //             ),
                //           ),
                //           child: Stack(
                //             children: [
                //               Positioned(
                //                 top: 20,
                //                 left: 20,
                //                 child: Text(
                //                   'Короткий Анализ',
                //                   style: TextStyle(
                //                     fontSize: 24,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //               ),
                //               Positioned(
                //                 top: 30,
                //                 right: 20,
                //                 child: Icon(
                //                   Icons.medical_services_rounded,
                //                   color: Colors.white,
                //                   size: 100,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                ListTile(
                  title: Text('Короткий анализ'),
                  onTap: () {
                    showMessageDialog(
                        message: 'Короткий Анализ',
                        content: medicalReport,
                        context: context,
                        actions: [
                          AppOutlinedButton(
                            title: 'Скачать PDF',
                            onPressed: () => print('Скачать PDF'),
                          ),
                        ]);
                  },
                ),
                ListTile(
                  title: Text('История болезни'),
                  onTap: () {
                    print('История болезни');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
