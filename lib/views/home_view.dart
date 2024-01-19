import 'package:deal_app/constants/app_colors.dart';
import 'package:deal_app/constants/app_texts.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List categories = ["Elektronik", "Moda", "Dekor", "Hobi"];

  List products = ["Klavye", "Koltuk"];

  List<Color> homeColors = [
    const Color(0xFFFBDCDA),
    const Color(0xFFD4EEF3),
    const Color(0xFFFAE6D5),
    const Color(0xFFEFCFE7),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            homeUpsideRow(context),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                homeSearchBar(context),
                const SizedBox(height: 20),
                advertImage(),
                categoriesTextsRow(context),
                categoriesListView(),
                popularTextsRow(context),
                popularListView(),
                const SizedBox(height: 40)
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox popularListView() {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width / 1.4,
            margin:
                const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.basicWhite,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 4, spreadRadius: 2)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customPopularImages(index, context),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      popularProducts(index, context),
                      Column(
                        children: [
                          customLocation(context),
                          const SizedBox(height: 10),
                          priceContainer(context),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Column popularProducts(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          products[index],
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          AppTexts.homeWarranty,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 16, color: Colors.black45),
        ),
        const SizedBox(
          height: 5,
        ),
        customFavColumn(context)
      ],
    );
  }

  ClipRRect customPopularImages(int index, BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Image.asset(
        "assets/${products[index]}.jpg",
        height: 150,
        width: MediaQuery.of(context).size.width / 1.4,
        fit: BoxFit.cover,
      ),
    );
  }

  Row customFavColumn(BuildContext context) {
    return Row(
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
    );
  }

  Padding customLocation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: Color(0xFFFF2F08),
            size: 20,
          ),
          const SizedBox(width: 2),
          Text(
            AppTexts.homeCity,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black45),
          ),
        ],
      ),
    );
  }

  Container priceContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Color(0xFFFF2F08),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
      child: Text(
        AppTexts.homePrice,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.basicWhite),
      ),
    );
  }

  Padding popularTextsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTexts.homePopular,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              AppTexts.homeSeeAll,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF2F08)),
            ),
          )
        ],
      ),
    );
  }

  SizedBox categoriesListView() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: homeColors[index],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/${categories[index]}.png",
                  height: 80,
                  width: 80,
                ),
                Text(
                  categories[index],
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding categoriesTextsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTexts.homeCategories,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              AppTexts.homeSeeAll,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF2F08)),
            ),
          ),
        ],
      ),
    );
  }

  Padding advertImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/apple_reklam.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container homeSearchBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: AppTexts.homeSearchText,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Padding homeUpsideRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.homeSlogan,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFFFF2F08),
                  ),
                  Text(
                    AppTexts.homeCity,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.basicBlack),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFFF2F08),
                  )
                ],
              )
            ],
          ),
          Stack(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage("assets/profile.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  left: 40,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.basicWhite, width: 3),
                        color: const Color(0xFFFF2F08),
                        shape: BoxShape.circle),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
