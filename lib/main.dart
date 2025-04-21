import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minhlostudio_web/home/home.dart';
import 'package:minhlostudio_web/home/privacy_term_sas/term_of_services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home/privacy_term_sas/policy_and_term_tower.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // Đặt route mặc định là HomeScreen
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            PrivacyPolicyScreen.routeName: (context) => const PrivacyPolicyScreen(),
            TermsOfServiceScreen.routeName: (context) => const TermsOfServiceScreen(),
            TermsOfServiceTowerStackScreen.routeName: (context) => const TermsOfServiceTowerStackScreen(),
            PrivacyPolicyTowerScreen.routeName: (context) => const PrivacyPolicyTowerScreen(),
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('vi'), // Vietnam
          ],
        );
      },
    );
  }
}
