part of 'widgets.dart';

class ImagesPicker extends StatelessWidget {
  final Function onTap;
  final List<Widget> listImage;

  ImagesPicker(
      {this.onTap,
      this.listImage = const [SizedBox(), SizedBox(), SizedBox()]});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ((MediaQuery.of(context).size.width - 2 * edge) / 3) + 18,
      width: MediaQuery.of(context).size.width - 2 * edge,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10), right: Radius.circular(10)),
            child: Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 2 * edge) / 3,
                  height: (MediaQuery.of(context).size.width - 2 * edge) / 3,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10)),
                      border: Border.all(color: Colors.grey)),
                  child: listImage[0],
                ),
                Container(
                    width: (MediaQuery.of(context).size.width - 2 * edge) / 3,
                    height: (MediaQuery.of(context).size.width - 2 * edge) / 3,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey))),
                    child: listImage[1]),
                Container(
                    width: (MediaQuery.of(context).size.width - 2 * edge) / 3,
                    height: (MediaQuery.of(context).size.width - 2 * edge) / 3,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(10)),
                        border: Border.all(color: Colors.grey)),
                    child: listImage[2])
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                if (onTap != null) onTap();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: turquoiseColor, shape: BoxShape.circle),
                child: Image.asset(
                  'assets/icon_add2.png',
                  color: whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
