import 'package:animated_introduction/animated_introduction.dart';
import 'package:deal_app/constants/app_colors.dart';
import 'package:flutter/material.dart';


final List<SingleIntroScreen> infoPages = [
   const SingleIntroScreen(
    title: 'Hoşgeldiniz',
    mainCircleBgColor: AppColors.primaryColor,
    sideDotsBgColor: AppColors.primaryColor,
    description: 'Kullanmadığınız bir çok eşyanız mı var?',
    textStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
    imageNetwork: 'https://static.vecteezy.com/system/resources/previews/010/880/096/original/3d-character-business-deal-png.png',
  ),
   const SingleIntroScreen(
    title: 'Hemen satabilirsiniz',
    mainCircleBgColor: AppColors.primaryColor,
    sideDotsBgColor: AppColors.primaryColor,
    description: 'Fiyat belirleyin ve ilan paylaşın!',
    textStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
    imageNetwork: 'https://static.vecteezy.com/system/resources/thumbnails/008/845/694/small_2x/3d-businessman-character-png.png',
  ),
   const SingleIntroScreen(
    title: 'Milyonlarca kullanıcıya erişin',
    mainCircleBgColor: AppColors.primaryColor,
    sideDotsBgColor: AppColors.primaryColor,
    description: 'Hem alıp hem de satabilirsiniz!',
    textStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
    imageNetwork: 'https://static.vecteezy.com/system/resources/thumbnails/008/845/707/small_2x/3d-businessman-character-png.png',
  ),
];