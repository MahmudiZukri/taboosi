part of 'models.dart';

class City {
  int id;
  String name;
  String cityImageURL;
  bool isAvailable;

  City(
      {required this.id,
      required this.name,
      required this.cityImageURL,
      this.isAvailable = false});
}
