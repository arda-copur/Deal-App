import 'dart:io';
import 'package:deal_app/constants/app_colors.dart';
import 'package:deal_app/constants/app_texts.dart';
import 'package:flutter/material.dart';



class AdvertisementCard extends StatefulWidget {
  final String titleText;
  final String priceText;
  final String locationText;
  final String imageText;
  final String descriptionText;
  final String statusText;
  const AdvertisementCard({
    Key? key,
    required this.titleText,
    required this.priceText,
    required this.locationText,
    required this.imageText,
    required this.descriptionText,
    required this.statusText,
  }) : super(key: key);

  @override
  State<AdvertisementCard> createState() => _AdvertisementCardState();
}

class _AdvertisementCardState extends State<AdvertisementCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      margin: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.basicWhite,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.file(
              File(widget.imageText),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titleText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.statusText,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16, color: Colors.black45),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: Color(0xFFFF2F08),
                          size: 20,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          AppTexts.homeLike,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xFFFF2F08),
                            size: 20,
                          ),
                          Text(
                            widget.locationText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                          color: Color(0xFFFF2F08),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20))),
                      child: Center(
                        child: Text(
                          "${widget.priceText} TL",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.basicWhite),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
