import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/I18n/app_translations.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_names.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Power Port',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        initialRoute: RouteNames.splash,
        getPages: AppPages.routes,
        locale: const Locale('en'),
        fallbackLocale: const Locale('en', 'US'),
        translations: AppTranslations(),
        supportedLocales: const [Locale('en', 'US'), Locale('hi', 'IN')],
        defaultTransition: Transition.native,
        builder: (context, child) => GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        ),
      );
}
