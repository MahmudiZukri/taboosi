part of 'pages.dart';

class DetailPhotoPage extends StatelessWidget {
  final List images;

  DetailPhotoPage(this.images);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Center(
              child: CarouselSlider(
                  items: images
                      .map((e) => InteractiveViewer(child: Image.network(e)))
                      .toList(),
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      enlargeCenterPage: true,
                      viewportFraction: 1))),
        ));
  }
}
