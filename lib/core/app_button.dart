import 'package:deal_app/constants/app_colors.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const AppButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: AppColors.basicBlack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
