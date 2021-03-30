part of 'pages.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 45, left: edge, right: edge),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/btn_back.png', height: 40))),
                Center(
                  child: Text(
                    'Tentang Aplikasi',
                    style: blackTextFont,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                  'Untuk menambahkan produk Anda bisa menekan tombol (+) kemudian mengisi data sesuai dengan produk.\n\nProduk akan langsung diupload ketika Anda menekan tombol "Upload Produk", diharapkan untuk memasukkan data yang valid.',
                  style: greyTextFont,
                  textAlign: TextAlign.justify)),
          Spacer(),
          Text('Copyright ©MahmudiZukri',
              style:
                  greyTextFont.copyWith(fontSize: 10, color: Colors.grey[300])),
          SizedBox(height: 20)
        ]));
  }
}
