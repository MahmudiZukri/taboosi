part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        exit(0);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: <Widget>[
              Container(color: backgroundColor),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: MediaQuery.of(context).size.height / 3 - 70,
                    color: greyColor2),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/splash.png',
                    height: MediaQuery.of(context).size.height / 2 - 100,
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
                            : MediaQuery.of(context).size.width < 400
                                ? MediaQuery.of(context).size.width / 2 - 30
                                : MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: turquoiseColor,
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
      ),
    );
  }
}
