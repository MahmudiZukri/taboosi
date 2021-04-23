part of 'pages.dart';

// ignore: must_be_immutable
class DetailPhotoPage extends StatefulWidget {
  final List<GadgetImage> images;
  GadgetImage image;

  DetailPhotoPage(this.images, this.image);

  @override
  _DetailPhotoPageState createState() => _DetailPhotoPageState();
}

class _DetailPhotoPageState extends State<DetailPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Center(
              child: Container(
            color: Color(0xFFF6F7F8),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: InteractiveViewer(
                    child: Image.network(
                      widget.image.image,
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: CarouselSlider(
                        items: widget.images
                            .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.image = e;
                                  });
                                },
                                child: Container(
                                    width: 100,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[400]!)),
                                    child: Image.network(e.image))))
                            .toList(),
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 2,
                            viewportFraction: 0.2)),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
