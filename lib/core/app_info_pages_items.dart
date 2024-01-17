import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageNetwork;
  final Color mainCircleBgColor;
  final Color sideDotsBgColor;

  const AppInfoPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageNetwork,
    required this.mainCircleBgColor,
    required this.sideDotsBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleIntroScreen(
      title: title,
      description: description,
      imageNetwork: imageNetwork,
      mainCircleBgColor: mainCircleBgColor,
      sideDotsBgColor: sideDotsBgColor,
    );
  }
}
