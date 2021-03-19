part of 'shared.dart';

void launchURL(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    launch(url);
  } else {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ErrorPage()));
  }
}

extension StringExtension on String {
  bool isDigit(int index) =>
      this.codeUnitAt(index) >= 48 && this.codeUnitAt(index) <= 57;
}
