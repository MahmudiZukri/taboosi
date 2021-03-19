part of 'widgets.dart';

class GadgetCard extends StatelessWidget {
  final Gadget gadget;

  GadgetCard(this.gadget);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(gadget)));
      },
      child: Container(
        color: whiteColor,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  height: 110,
                  width: 130,
                  child: Stack(
                    children: [
                      Image.network(
                        gadget.photos[0],
                        height: 110,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Container(
                      //     height: 20,
                      //     width: 53,
                      //     decoration: BoxDecoration(
                      //         color: turquoiseColor,
                      //         borderRadius: BorderRadius.only(
                      //             bottomLeft: Radius.circular(20))),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Image.asset('assets/star.png', height: 16),
                      //         SizedBox(width: 2),
                      //         Text(
                      //           '${gadget.rating}/5',
                      //           style: whiteTextFont.copyWith(fontSize: 11),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                )),
            SizedBox(width: 20),
            Flexible(
              child: Container(
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(gadget.name, style: blackTextFont, maxLines: 2),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text('Rp ', style: greyTextFont.copyWith(fontSize: 16)),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id_iD', symbol: '', decimalDigits: 0)
                              .format(gadget.price),
                          style: purpleTextFont,
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      gadget.city,
                      style: greyTextFont,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
