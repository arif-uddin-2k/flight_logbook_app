import 'package:device_preview/device_preview.dart';
import 'package:flight_log_book/screens/main_navbar_screen.dart';
import 'package:flight_log_book/theme/light_theme_data.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.getLightThemeData()
,      home: const MainBottomNavScreen(),
    );
  }
}
