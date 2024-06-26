part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final Gadget gadget;

  DetailPage(this.gadget);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> _confirmCall() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Konfirmasi', style: turquoiseTextFont),
            content: Text('Apakah Anda ingin menghubungi penjual?',
                style: greyTextFont.copyWith(fontSize: 14)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            actions: <Widget>[
              TextButton(
                child: Text('Chat via WhatsApp',
                    style: turquoiseTextFont.copyWith(fontSize: 12)),
                onPressed: () {
                  final String message =
                      "Hai, saya tertarik dengan smartphone anda ${widget.gadget.name}. Apakah masih tersedia?";
                  final String url =
                      'whatsapp://send?phone=${widget.gadget.phone}&text=$message';
                  Navigator.of(context).pop();
                  launchURL(context, url);
                },
              ),
              TextButton(
                child:
                    Text('Ya', style: turquoiseTextFont.copyWith(fontSize: 12)),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchURL(context, 'tel:${widget.gadget.phone}');
                },
              ),
              TextButton(
                child: Text('Tidak',
                    style: turquoiseTextFont.copyWith(fontSize: 12)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    int index = 0;
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F8),
      body: SafeArea(
          child: Stack(
        children: [
          //NOTE: GADGET IMAGE
          Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: widget.gadget.gadgetID!,
                child: Image.network(widget.gadget.photos![0],
                    height: 350, fit: BoxFit.cover),
              )),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/btn_back.png', height: 40)),
                  ],
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 258, end: 222),
                duration: Duration(milliseconds: 1150),
                builder: (BuildContext context, double _value, child) {
                  return SizedBox(height: _value);
                },
                // child: SizedBox(height: 222)
              ), //sebelumnya 228
              Container(
                padding: EdgeInsets.symmetric(horizontal: edge),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //NOTE: GADGET NAME
                            Container(
                              width:
                                  MediaQuery.of(context).size.width - 2 * edge,
                              child: Text(widget.gadget.name,
                                  style: blackTextFont.copyWith(fontSize: 22),
                                  maxLines: 2),
                            ),
                            Row(
                              children: [
                                Text('Rp ',
                                    style: greyTextFont.copyWith(fontSize: 16)),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_iD',
                                          symbol: '',
                                          decimalDigits: 0)
                                      .format(widget.gadget.price),
                                  style: turquoiseTextFont,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    //NOTE: KETERANGAN
                    Text(
                      'Keterangan',
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/battery.png',
                                color: turquoiseColor, height: 32),
                            SizedBox(height: 8),
                            Text(widget.gadget.battery,
                                style:
                                    turquoiseTextFont.copyWith(fontSize: 14)),
                            Text(' mAh', style: greyTextFont)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/screen.png',
                                color: turquoiseColor, height: 32),
                            SizedBox(height: 8),
                            Text(widget.gadget.screen,
                                style:
                                    turquoiseTextFont.copyWith(fontSize: 14)),
                            Text(' inch', style: greyTextFont)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/camera.png',
                                color: turquoiseColor, height: 32),
                            SizedBox(height: 8),
                            Text(widget.gadget.camera,
                                style:
                                    turquoiseTextFont.copyWith(fontSize: 14)),
                            Text(' MP', style: greyTextFont)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/chipset.png',
                                color: turquoiseColor, height: 32),
                            SizedBox(height: 8),
                            Text(widget.gadget.chipset,
                                style:
                                    turquoiseTextFont.copyWith(fontSize: 14)),
                            Text(widget.gadget.chipsetSeries,
                                style: greyTextFont)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.gadget.desc!,
                      style: greyTextFont,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    //NOTE: PHOTOS
                    Text(
                      'Foto',
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              Container(
                height: 150,
                color: Colors.white,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.gadget.photos!.map((e) {
                      index++;

                      return Container(
                        padding: EdgeInsets.only(
                            left: index == 1 ? 24 : 18,
                            right:
                                index == widget.gadget.photos!.length ? 24 : 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  BouncyPageRoute(
                                      widget: DetailPhotoPage(
                                          widget.gadget.photos!
                                              .map((e) => GadgetImage(e))
                                              .toList(),
                                          GadgetImage(e))));
                            },
                            child: Image.network(
                              e,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }).toList()),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    //NOTE: LOKASI COD
                    Text(
                      'Lokasi COD',
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:
                              MediaQuery.of(context).size.width - 2 * edge - 64,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.gadget.address,
                                  style: greyTextFont, maxLines: 3),
                              SizedBox(height: 2),
                              Container(
                                child: Text(
                                  widget.gadget.city!,
                                  style: greyTextFont,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              launchURL(context, widget.gadget.mapURL!);
                            },
                            child:
                                Image.asset('assets/btn_map.png', height: 40))
                      ],
                    ),
                    SizedBox(height: 12),
                    //NOTE: NAMA PENJUAL
                    Text('Nama Seller',
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    Text(widget.gadget.seller, style: greyTextFont),
                    SizedBox(height: 30),
                    //NOTE: HUBUNGI PENJUAL
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.height - 2 * edge,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor: turquoiseColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                _confirmCall();
                              },
                              child: Text('Hubungi Penjual',
                                  style: whiteTextFont))),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
