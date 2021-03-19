part of 'models.dart';

class Gadget {
  int price;
  String name;
  String city;
  String phone;
  String mapURL;
  String address;
  String battery;
  String screen;
  String camera;
  String chipset;
  String chipsetSeries;
  String desc;
  String seller;
  List photos;
  String gadgetID;

  // int rating;

  //TODO: Membuat logo
  //TODO: Membuat LovePage yang udah di tandain user dengan memanfaatkan gadgetID yang udah ada di Firestore
  //TODO: Membuat shared preference untuk love / favorite.
  //TODO: Ngebetulin back button sama title AddPage
  //TODO: User ngasih map lokasi COD dan foto barang untuk Firestore
  //TODO: Mengatur TextField kalo diinput dengan harga biar jadi format currency (make titik gitu)
  //TODO: Make firebase Storage buat penyimpanan gambar user, kita tonton ulang video pak Erico. Oiya sekaligus kita nyari tau mgna biar bisa user langsung milih banyak foto
  //TODO: Bikin collection Draft buat ngereview POST dari user

  //TODO: Button 'Hubungi Penjual' kita bikin ada 3 pilihan, yaitu Dapatkan Nomor, Hubungi lewat WA, Kembali. DIPERTIMBANGKAN

  Gadget({
    this.price,
    this.name,
    this.city,
    this.phone,
    this.mapURL,
    this.address,
    this.battery,
    this.screen,
    this.camera,
    this.chipset,
    this.chipsetSeries,
    this.desc,
    this.seller,
    this.photos,
    this.gadgetID,

    // this.rating,
  });

  // factory Gadget.fromJson(Map<String, dynamic> json) {
  //   return Gadget(
  //       rating: json['rating'],
  //       price: json['price'],
  //       name: json['name'],
  //       city: json['city'],
  //       phone: json['phone'],
  //       mapURL: json['map_url'],
  //       address: json['address'],
  //       battery: json['battery'],
  //       screen: json['screen'],
  //       camera: json['camera'],
  //       chipset: json['chipset'],
  //       chipsetSeries: json['chipsetSeries'],
  //       photos: json['photos']);
  // }

  // Gadget.fromJson(json) {
  //   id = json['id'];
  //   address = json['address'];
  //   city = json['city'];
  //   country = json['country'];
  //   mapURL = json['map_url'];
  //   name = json['name'];
  //   numberOfBedrooms = json['number_of_bedrooms'];
  //   numberOfCupboards = json['number_of_cupboards'];
  //   numberOfKitchens = json['number_of_kitchens'];
  //   phone = json['phone'];
  //   photos = json['photos'];
  //   price = json['price'];
  //   rating = json['rating'];
  // }
}
