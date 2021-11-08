
import 'package:doctor_profile/views/appointments/appointment_detail_page.dart';
import 'package:doctor_profile/views/appointments/appointment_review.dart';
import 'package:doctor_profile/views/appointments/services_page.dart';
import 'package:doctor_profile/views/main/main_page.dart';
import 'package:doctor_profile/views/payments/coupons_page.dart';
import 'package:doctor_profile/views/payments/pending_payments_page.dart';
import 'package:doctor_profile/views/profile/profile_survey_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  setStatusBar();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Perfil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xff00b88c),
      ),
      locale: const Locale('es',''),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainPage(),
    );
  }
}

void setStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff00b88c),
    statusBarIconBrightness: Brightness.light, // android
    statusBarBrightness: Brightness.dark, // ios
    systemNavigationBarColor: Colors.white,
  ));
}
