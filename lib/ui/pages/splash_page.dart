part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: MediaQuery.of(context).size.height / 2 - 130,
                  color: greyColor2),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  //Foto oleh Sound On dari Pexels
                  'assets/splash.png',
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.cover,
                )),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/logo.png', width: 60, height: 60),
                  SizedBox(height: 30),
                  Text('Temukan Gadget\nSecondmu disini!',
                      style: blackTextFont.copyWith(fontSize: 24)),
                  SizedBox(height: 10),
                  Text('Selama kualitas bagus, second juga menarik bukan?',
                      style: greyTextFont.copyWith(fontSize: 16)),
                  SizedBox(height: 40),
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width > 600
                          ? 210
                          : MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: turquoiseColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text('Explore Now', style: whiteTextFont),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
