import 'package:flutter/material.dart';
import 'package:deal_app/constants/app_colors.dart';
import 'package:deal_app/utils/info_view_utils.dart';
import 'package:deal_app/views/bottom_view.dart';
import 'package:animated_introduction/animated_introduction.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
          slides: infoPages,
          containerBg: AppColors.basicWhite,
          indicatorType: IndicatorType.circle,
          nextText: "Devam",
          doneText: "Anladım",
          skipText: "Geç",
          footerBgColor: AppColors.thirdColor,
          activeDotColor: Colors.white,
          doneWidget: const Icon(
            Icons.chevron_right_sharp,
            size: 36,
            color: Colors.white,
          ),
          inactiveDotColor: Colors.black,
          nextWidget: const Icon(
            Icons.chevron_right_sharp,
            size: 36,
            color: Colors.white,
          ),
          onDone: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomView()));
          }),
    );
  }
}
