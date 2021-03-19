part of 'models.dart';

class City {
  int id;
  String name;
  String cityImageURL;
  bool isAvailable;

  City({this.id, this.name, this.cityImageURL, this.isAvailable = false});
}
