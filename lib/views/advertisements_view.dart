import 'package:deal_app/constants/app_texts.dart';
import 'package:deal_app/features/advertisement_card.dart';
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
  String selectedCategory = "Hepsi";

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

  Future<void> _getAdverts() async {
    setState(() {
      adverts = dbHelper.getAdvertsByCategory(selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
                _getAdverts();
              });
            },
            items: ["Hepsi", "Elektronik", "Moda", "Dekor", "Hobi", "Mobilya"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
          ),
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
                  return Center(child: Text(AppTexts.notYet));
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
                          statusText: advert.status,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AdvertisementDetailView(advert: advert)));
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
