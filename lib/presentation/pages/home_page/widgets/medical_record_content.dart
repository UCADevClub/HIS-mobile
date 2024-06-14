import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
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

class MedicalRecordContent extends StatelessWidget {
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
                ListTile(
                  title: Text(context.l10n.short_analysis),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(context.l10n.illness_history),
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
