import 'package:deal_app/core/advertisement_card.dart';
import 'package:deal_app/model/advert.dart';
import 'package:deal_app/utils/db_helper.dart';
import 'package:deal_app/views/advertisement_detail.view.dart';
import 'package:flutter/material.dart';


class AdvertisementsView extends StatefulWidget {
  const AdvertisementsView({super.key});

  @override
  State<AdvertisementsView> createState() => _AdvertisementsViewState();
}

class _AdvertisementsViewState extends State<AdvertisementsView> {
  DatabaseHelper dbHelper = DatabaseHelper();
  late Future<List<Advert>> adverts;

  @override
  void initState() {
    super.initState();
    refreshAdverts();
  }

  Future<void> refreshAdverts() async {
    setState(() {
      adverts = dbHelper.getAdverts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: adverts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Hata: ${snapshot.error}'));
                } else if (!snapshot.hasData ||
                    (snapshot.data as List).isEmpty) {
                  return const Center(child: Text('Henüz ilan paylaşılmamış.'));
                } else {
                  List<Advert> advertList = snapshot.data as List<Advert>;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: advertList.length,
                    itemBuilder: (context, index) {
                      Advert advert = advertList[index];
                      return GestureDetector(
                        child: AdvertisementCard(
                            titleText: advert.title,
                            priceText: advert.price.toString(),
                            locationText: advert.location,
                            imageText: advert.fotoPath!,
                            descriptionText: advert.description,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> AdvertisementDetailView(advert: advert)));
                            },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
