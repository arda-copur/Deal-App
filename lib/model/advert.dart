class Advert {
  int? id;
  String title;
  String? fotoPath;
  String description;
  int price;
  String location;
  String? category;
  int phoneNumber;
  String status;

  Advert({
   this.id,
   required this.title,
   this.fotoPath,
   required this.description,
   required this.price,
   required this.location,
   required this.category,
   required this.phoneNumber,
   required this.status,
  });

  Map<String,dynamic> toMap() {
    return {
      'id':id,
      'title':title,
      'fotoPath': fotoPath,
      'description': description,
      'price':price,
      'location':location,
      'category': category,
      'phoneNumber': phoneNumber,
      'status': status,
    };
  }

  factory Advert.fromMap(Map<String, dynamic> map) {
    return Advert(
      id: map['id'],
      title: map['title'],
      fotoPath: map['fotoPath'],
      description: map['description'],
      price: map['price'],
      location: map['location'],
      category: map['category'],
      phoneNumber: map['phoneNumber'],
      status: map['status']
    );
  }
}