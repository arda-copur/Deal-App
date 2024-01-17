import 'dart:io';
import 'package:deal_app/model/advert.dart';
import 'package:deal_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class ShareAdvertisementView extends StatefulWidget {
  const ShareAdvertisementView ({super.key});

  @override
 State<ShareAdvertisementView > createState() => _ShareAdvertisementViewState();
}

class _ShareAdvertisementViewState  extends State<ShareAdvertisementView > {
  File? selectedImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper();

  final List<String> categories = ["Elektronik","Moda","Dekor","Hobi","Mobilya"];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İlan Paylaş'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Fotoğraf Seç'),
            ),
            selectedImage != null
                ? Image.file(selectedImage!, height: 100)
                : Container(),
            const SizedBox(height: 10,),
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
              }).toList()
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Başlık'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Açıklama'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Fiyat'),
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Konum'),
            ),
              TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'İrtibat No'),
            ),
              TextField(
              controller: statusController,
              decoration: const InputDecoration(labelText: 'Durumu'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                shareButton();
              },
              child: const Text('Paylaş'),
            ),
        
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  void shareButton() async {
    String title = titleController.text;
    String description = descriptionController.text;
    int price =  int.parse(priceController.text);
    String location = locationController.text;
    int phoneNumber = int.parse(phoneNumberController.text);
    String status = statusController.text;

    if (title.isNotEmpty && description.isNotEmpty && price > 0 && location.isNotEmpty && status.isNotEmpty) {
      Advert advert = Advert(
        
        title: title,
        category: selectedCategory,
        fotoPath: selectedImage?.path,
        description: description,
        price: price,
        location: location,
        phoneNumber: phoneNumber,
        status: status
      );

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
