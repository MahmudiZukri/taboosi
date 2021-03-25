part of 'models.dart';

class Note {
  int id;
  String name;
  String noteImageURL;
  String desc;

  Note(
      {required this.id,
      required this.name,
      required this.noteImageURL,
      required this.desc});
}
