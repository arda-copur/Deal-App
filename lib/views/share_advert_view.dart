import 'dart:io';
import 'package:deal_app/constants/app_colors.dart';
import 'package:deal_app/core/app_button.dart';
import 'package:deal_app/model/advert.dart';
import 'package:deal_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShareAdvertisementView extends StatefulWidget {
  const ShareAdvertisementView({super.key});

  @override
  State<ShareAdvertisementView> createState() => _ShareAdvertisementViewState();
}

class _ShareAdvertisementViewState extends State<ShareAdvertisementView> {
  File? selectedImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper();

  final List<String> categories = [
    "Elektronik",
    "Moda",
    "Dekor",
    "Hobi",
    "Mobilya"
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: _pickImage,
                child:  Text('Fotoğraf Ekle',style: Theme.of(context).textTheme.bodyMedium),
              ),
              selectedImage != null
                  ? Image.file(selectedImage!, height: 100)
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                  hint: const Text("Kategori seç"),
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList()),
              customTextFormField(titleController, "İlan adı",
                  const Icon(Icons.turned_in_outlined)),
              customTextFormField(descriptionController, "Açıklama",
                  const Icon(Icons.description)),
              customTextFormField(
                  priceController, "Fiyat", const Icon(Icons.money)),
              customTextFormField(locationController, "Konum",
                  const Icon(Icons.location_city_outlined)),
              customTextFormField(phoneNumberController, "Telefon Numarası",
                  const Icon(Icons.phone)),
              customTextFormField(statusController, "İlan durumu",
                  const Icon(Icons.broken_image)),
              const SizedBox(height: 16),
              AppButton(
                  onPressed: () {
                    shareButton();
                  },
                  title: "Paylaş")
            ],
          ),
        ),
      ),
    );
  }

  Column customTextFormField(
      TextEditingController controller, String fieldTitle, Icon prefix) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(8)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: fieldTitle,
                  border: InputBorder.none,
                  prefixIcon: prefix),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  void shareButton() async {
    String title = titleController.text;
    String description = descriptionController.text;
    int price = int.parse(priceController.text);
    String location = locationController.text;
    int phoneNumber = int.parse(phoneNumberController.text);
    String status = statusController.text;

    if (title.isNotEmpty &&
        description.isNotEmpty &&
        price > 0 &&
        location.isNotEmpty &&
        status.isNotEmpty) {
      Advert advert = Advert(
          title: title,
          category: selectedCategory,
          fotoPath: selectedImage?.path,
          description: description,
          price: price,
          location: location,
          phoneNumber: phoneNumber,
          status: status);

      await dbHelper.insertAdvert(advert);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Eksik Bilgi'),
            content: const Text('Lütfen tüm alanları doldurun.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }
}
