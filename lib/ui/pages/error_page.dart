part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/error404.png', height: 85, width: 300),
              SizedBox(height: 70),
              Text('Where are you going?',
                  style: blackTextFont.copyWith(fontSize: 24)),
              SizedBox(height: 14),
              Text('Sepertinya halaman yang\nkamu cari sudah hilang',
                  style: greyTextFont.copyWith(fontSize: 14),
                  textAlign: TextAlign.center),
              SizedBox(height: 50),
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
                        Navigator.pop(context);
                      },
                      child: Text('Kembali', style: whiteTextFont)))
            ],
          ),
        ),
      ),
    );
  }
}
