import 'package:deal_app/constants/app_colors.dart';
import 'package:deal_app/views/advertisements_view.dart';
import 'package:deal_app/views/home_view.dart';
import 'package:deal_app/views/share_advert_view.dart';
import 'package:flutter/material.dart';


class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeView(),
    const AdvertisementsView(),
    const ShareAdvertisementView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        fixedColor: AppColors.basicWhite,
        unselectedItemColor: AppColors.basicGrey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: AppColors.basicWhite,),
          label: "Home"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list,color: AppColors.basicWhite,),
          label: "Advertisements"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add,color: AppColors.basicWhite,),
          label: "Share"
          ),
        ],
      ),
    );
  }
}