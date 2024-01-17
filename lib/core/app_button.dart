import 'package:deal_app/constants/app_colors.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const AppButton({
    Key? key,

    required this.onPressed, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
       child: Text(title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.basicWhite),),
      ),
    );
  }
}
