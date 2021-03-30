part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int selectedItem;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => SplashPage()));

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            bottom: false,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 24),
                      //NOTE: TITLE
                      Text('Taboosi',
                          style: blackTextFont.copyWith(fontSize: 28)),
                      SizedBox(height: 2),
                      Text(
                          'Aplikasi ringan yang dapat membantu Anda menjual dan membeli smartphone second',
                          style: greyTextFont.copyWith(fontSize: 16)),
                      SizedBox(height: 30),
                      //NOTE: POPULAR CITIES
                      Text('Daerah yang tersedia saat ini',
                          style: blackTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    SizedBox(width: edge),
                    CityCard(City(
                        id: 0,
                        name: 'Padang -\nsidimpuan',
                        cityImageURL: 'assets/city1.png',
                        isAvailable: true)),
                    SizedBox(width: 20),
                    CityCard(City(
                        id: 1,
                        name: 'Medan',
                        cityImageURL: 'assets/city2.png')),
                    SizedBox(width: 20),
                    CityCard(City(
                        id: 2,
                        name: 'Sibolga',
                        cityImageURL: 'assets/city4.png')),
                    SizedBox(width: 20),
                    CityCard(City(
                        id: 3,
                        name: 'Jakarta',
                        cityImageURL: 'assets/city5.png')),
                    SizedBox(width: 20),
                    CityCard(City(
                        id: 4,
                        name: 'Bandung',
                        cityImageURL: 'assets/city6.png')),
                    SizedBox(width: edge),
                  ]),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //NOTE: RECOMMENDED GADGET
                      Text('Daftar gadget',
                          style: blackTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      SizedBox(height: 16),

                      FutureBuilder(
                          future: GadgetServices.getGadgets(),
                          builder:
                              (context, AsyncSnapshot<List<Gadget>> snapshot) {
                            if (snapshot.hasData) {
                              List<Gadget>? data = snapshot.data;

                              return Column(
                                children: data!
                                    .map((e) => Container(
                                        margin: EdgeInsets.only(bottom: 30),
                                        child: GadgetCard(e)))
                                    .toList(),
                              );
                            } else {
                              return SizedBox(
                                width: 200.0,
                                height: 100.0,
                                child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Column(
                                      children: [
                                        ShimmerLayout(),
                                        SizedBox(height: 30)
                                      ],
                                    )),
                              );
                            }
                          }),

                      //NOTE: CATATAN
                      Text('Catatan',
                          style: blackTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      SizedBox(height: 16),
                      NoteCard(
                        Note(
                            id: 1,
                            name: 'Tentang Aplikasi',
                            noteImageURL: 'assets/note.png',
                            desc: 'Updated 20 Apr'),
                        onTap: () {},
                      ),

                      SizedBox(height: 100)
                    ],
                  ),
                )
              ],
            )), //NOTE: NAVBAR
        // floatingActionButton: Container(
        //   height: 63,
        //   width: MediaQuery.of(context).size.width - 2 * edge,
        //   decoration: BoxDecoration(
        //       color: Color(0xFFF6F7F8), borderRadius: BorderRadius.circular(23)),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       BottomNavbarItem(
        //           iconURL: 'assets/icon_home.png',
        //           onTap: () {
        //             setState(() {
        //               selectedItem = 0;
        //             });
        //           },
        //           isActive: selectedItem == 0 ? true : false),
        //       // BottomNavbarItem(
        //       //     iconURL: 'assets/icon_search.png',
        //       //     onTap: () {
        //       //       setState(() {
        //       //         selectedItem = 1;
        //       //       });
        //       //     },
        //       //     isActive: selectedItem == 1 ? true : false),
        //       BottomNavbarItem(
        //         iconURL: 'assets/icon_add.png',
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (_) => AddPage(Gadget())));
        //         },
        //         iconSize: 50,
        //       ),
        //       BottomNavbarItem(
        //           iconURL: 'assets/icon_love.png',
        //           onTap: () {
        //             setState(() {
        //               selectedItem = 1;
        //             });
        //           },
        //           isActive: selectedItem == 1 ? true : false),
        //       // BottomNavbarItem(
        //       //     iconURL: 'assets/icon_user.png',
        //       //     onTap: () {
        //       //       setState(() {
        //       //         selectedItem = 4;
        //       //       });
        //       //     },
        //       //     isActive: selectedItem == 4 ? true : false),
        //     ],
        //   ),
        // ),
        //NOTE: FLOATING ACTION BUTTON
        floatingActionButton: Container(
          margin: EdgeInsets.only(right: 10, bottom: 10),
          child: FloatingActionButton(
              backgroundColor: turquoiseColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AddPage()));
              },
              child: Icon(Icons.add, color: whiteColor)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
