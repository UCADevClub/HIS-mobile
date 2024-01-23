import 'dart:ui';

import 'app_colors.dart';

class AppColorsLight extends AppColors {
  const AppColorsLight();

  @override
  Color get primaryColor => const Color(0xff5ABDDA);

  @override
  Color get secondaryColor => throw UnimplementedError();

  @override
  Color get white => const Color(0xffffffff);

  @override
  Color get black => const Color(0xff000000);

}