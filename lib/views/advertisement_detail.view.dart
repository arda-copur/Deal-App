import 'dart:io';
import 'dart:ui';
import 'package:deal_app/constants/app_colors.dart';
import 'package:deal_app/model/advert.dart';
import 'package:flutter/material.dart';


class AdvertisementDetailView extends StatelessWidget {
  final Advert advert;
  const AdvertisementDetailView({super.key, required this.advert});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image.file(
                File(advert.fotoPath.toString()),
                fit: BoxFit.cover,
              )),
          customContainer(context),
          customScroll(),
        ],
      ),
    ));
  }

  customContainer(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.basicWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  customScroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Padding(padding: const EdgeInsets.only(top: 10,bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: 35,
                      color: Colors.black12,
                    ),
                  ],
                ),
                ),
                 Text(advert.title,style: Theme.of(context).textTheme.headlineLarge),
                 
                 const SizedBox(height: 10,),
              
                 const Padding(
                   padding: EdgeInsets.symmetric(vertical: 15),
                   child: Divider(height: 4,color: Color.fromARGB(255, 218, 217, 217),),
                 ),
                Text("Açıklama",style: Theme.of(context).textTheme.titleLarge),
                 const SizedBox(height: 10,),
                 Text(advert.description,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.basicGrey)),
                 
                ],
              ),
        );
      },
    );
  }
}
