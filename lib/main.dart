import 'package:deal_app/constants/app_colors.dart';
import 'package:deal_app/views/info_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.exColor),
        scaffoldBackgroundColor: AppColors.basicWhite,
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.exColor),
        cardColor: AppColors.basicWhite,
        textTheme: const TextTheme(displayMedium: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: AppColors.basicWhite))
      ),
      home: const InfoView(),
    );
  }
}

