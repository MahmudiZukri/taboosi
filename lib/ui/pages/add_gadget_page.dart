part of 'pages.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // final TextEditingController mapURLController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController batteryController = TextEditingController();
  final TextEditingController screenController = TextEditingController();
  final TextEditingController cameraController = TextEditingController();
  final TextEditingController chipsetController = TextEditingController();
  final TextEditingController chipsetSeriesController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController sellerController = TextEditingController();

  List<File> _images = [];
  final picker = ImagePicker();
  List<String> imagesURL = [];
  bool isUploading = false;

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
    nameController.dispose();
    cityController.dispose();
    phoneController.dispose();
    addressController.dispose();
    batteryController.dispose();
    screenController.dispose();
    cameraController.dispose();
    chipsetController.dispose();
    chipsetSeriesController.dispose();
    descController.dispose();
    sellerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 20, left: edge, right: edge),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              Image.asset('assets/btn_back.png', height: 40))),
                  Center(
                    child: Text(
                      'Tambah Produk',
                      style: blackTextFont,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextfieldCard(
                    controller: nameController,
                    width: MediaQuery.of(context).size.width - 2 * edge,
                    labelText: 'Nama Produk',
                    hintText: 'e.g. Xiaomi Mi 11 6/64',
                  ),
                  TextfieldCard(
                      controller: priceController,
                      width: MediaQuery.of(context).size.width - 2 * edge,
                      labelText: 'Harga Produk',
                      // onChanged: (text) {
                      //   String temp = '';

                      //   for (int i = 0; i < text.length; i++) {
                      //     temp += text.isDigit(i) ? text[i] : '';
                      //   }

                      //   setState(() {
                      //     selectedPrice = int.tryParse(temp) ?? 987;
                      //   });

                      //   priceController.selection = TextSelection.fromPosition(
                      //       TextPosition(offset: priceController.text.length));
                      // },
                      inputNumber: true),
                  TextfieldCard(
                      controller: batteryController,
                      width: MediaQuery.of(context).size.width - 2 * edge,
                      labelText: 'Daya Baterai (mAh)',
                      hintText: 'e.g. 4000',
                      inputNumber: true),
                  TextfieldCard(
                      controller: screenController,
                      width: MediaQuery.of(context).size.width - 2 * edge,
                      labelText: 'Ukuran Layar (inch)',
                      hintText: 'e.g. 6,53',
                      inputNumber: true),
                  TextfieldCard(
                      controller: cameraController,
                      width: MediaQuery.of(context).size.width - 2 * edge,
                      labelText: 'Resolusi Kamera (MP)',
                      hintText: 'e.g. 48',
                      inputNumber: true),
                  Row(
                    children: [
                      TextfieldCard(
                          controller: chipsetController,
                          labelText: 'Chipset',
                          hintText: 'e.g. Mediatek',
                          width: (MediaQuery.of(context).size.width -
                                  2 * edge -
                                  15) /
                              2),
                      SizedBox(width: 15),
                      TextfieldCard(
                          controller: chipsetSeriesController,
                          labelText: 'Seri chipset',
                          hintText: 'e.g. Helio G90T',
                          width: (MediaQuery.of(context).size.width -
                                  2 * edge -
                                  15) /
                              2),
                    ],
                  ),
                  TextfieldCard(
                    controller: descController,
                    width: MediaQuery.of(context).size.width - 2 * edge,
                    height: 100,
                    maxLines: 3,
                    labelText: 'Keterangan Tambahan untuk Produk',
                  ),
                  TextfieldCard(
                    controller: sellerController,
                    width: MediaQuery.of(context).size.width - 2 * edge,
                    labelText: 'Nama Penjual',
                  ),
                  TextfieldCard(
                    controller: phoneController,
                    width: MediaQuery.of(context).size.width - 2 * edge,
                    labelText: 'No. Handphone',
                    hintText: 'e.g. 0821********',
                    inputNumber: true,
                  ),
                  Text(
                    'Lokasi COD',
                    style: greyTextFont,
                  ),
                  SizedBox(height: 10),
                  TextfieldCard(
                    controller: addressController,
                    width: MediaQuery.of(context).size.width - 2 * edge,
                    labelText: 'Alamat',
                    hintText: 'e.g. Jl. Sutan Soripada Mulia ...',
                  ),
                  TextfieldCard(
                    controller: cityController,
                    width: MediaQuery.of(context).size.width - 2 * edge,
                    labelText: 'Kota',
                    hintText: 'e.g. Padangsidimpuan',
                  ),
                  Text(
                    'Upload Foto Produk',
                    style: greyTextFont,
                  ),
                  Text('Note: Foto yang pertama akan menjadi thumbnail',
                      style: greyTextFont.copyWith(
                          fontSize: 10, color: Colors.grey[350])),
                  SizedBox(height: 10),
                  //NOTE: UPLOAD FOTO
                  Container(
                    height: 210,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: GridView.builder(
                        itemCount: _images.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Center(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: turquoiseColor,
                                      ),
                                      onPressed: _images.length < 8
                                          ? () {
                                              chooseImage();
                                            }
                                          : () {
                                              final snackBar = SnackBar(
                                                  backgroundColor:
                                                      Colors.red[400],
                                                  duration: Duration(
                                                      milliseconds: 1500),
                                                  content: Row(
                                                    children: [
                                                      Icon(Icons.dangerous,
                                                          color: whiteColor),
                                                      SizedBox(width: 8),
                                                      Text(
                                                          'Upload foto produk maksimal 8')
                                                    ],
                                                  ));

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }))
                              : Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(_images[index -
                                              1]))), //karna index 0 dah kepake jadi otomatis yang kesini index ke 1 dst jdi kita harus kurangin 1 biar foto yg pertama itu _image[0]
                                );
                        }),
                  ),

                  Center(
                    child: Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 40, bottom: 5),
                        color: whiteColor,
                        width: MediaQuery.of(context).size.width > 600
                            ? 210
                            : MediaQuery.of(context).size.width / 2,
                        child: isUploading
                            ? Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          whiteColor),
                                      backgroundColor: turquoiseColor),
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: turquoiseColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                                onPressed: () async {
                                  if (!(nameController.text.trim() != '' &&
                                      cityController.text.trim() != '' &&
                                      phoneController.text.trim() != '' &&
                                      addressController.text.trim() != '' &&
                                      batteryController.text.trim() != '' &&
                                      screenController.text.trim() != '' &&
                                      cameraController.text.trim() != '' &&
                                      chipsetController.text.trim() != '' &&
                                      chipsetSeriesController.text.trim() !=
                                          '' &&
                                      descController.text.trim() != '' &&
                                      sellerController.text.trim() != '')) {
                                    final snackBar = SnackBar(
                                        backgroundColor: Colors.red[400],
                                        duration: Duration(milliseconds: 1500),
                                        content: Row(
                                          children: [
                                            Icon(Icons.dangerous,
                                                color: whiteColor),
                                            SizedBox(width: 8),
                                            Text('Tolong isi semua field')
                                          ],
                                        ));

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else if (_images.length < 3) {
                                    final snackBar = SnackBar(
                                        backgroundColor: Colors.red[400],
                                        duration: Duration(milliseconds: 1500),
                                        content: Row(
                                          children: [
                                            Icon(Icons.dangerous,
                                                color: whiteColor),
                                            SizedBox(width: 8),
                                            Text('Upload foto produk minimal 3')
                                          ],
                                        ));

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    setState(() {
                                      isUploading = true;
                                    });
                                    await uploadImage();
                                    await GadgetServices.addGadget(
                                        Gadget(
                                            price:
                                                int.parse(priceController.text),
                                            // selectedPrice,
                                            name: nameController.text,
                                            city: cityController.text,
                                            phone: phoneController.text,
                                            // mapURL: mapURLController.text,
                                            address: addressController.text,
                                            battery: batteryController.text,
                                            screen: screenController.text,
                                            camera: cameraController.text,
                                            chipset: chipsetController.text,
                                            chipsetSeries:
                                                chipsetSeriesController.text,
                                            desc: descController.text,
                                            seller: sellerController.text),
                                        photos: imagesURL);

                                    priceController.text = '';
                                    nameController.text = '';
                                    cityController.text = '';
                                    phoneController.text = '';
                                    // mapURLController.text ='';
                                    addressController.text = '';
                                    batteryController.text = '';
                                    screenController.text = '';
                                    cameraController.text = '';
                                    chipsetController.text = '';
                                    chipsetSeriesController.text = '';
                                    descController.text = '';
                                    sellerController.text = '';

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => HomePage()));

                                    final snackBar = SnackBar(
                                        backgroundColor: Colors.green[400],
                                        duration: Duration(milliseconds: 1500),
                                        content: Row(
                                          children: [
                                            Icon(Icons.check_box,
                                                color: whiteColor),
                                            SizedBox(width: 8),
                                            Text('Produk berhasil diupload')
                                          ],
                                        ));

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                child:
                                    Text('Upload Produk', style: whiteTextFont),
                              )),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  chooseImage() async {
    final PickedFile? pickedFile =
        await picker.getImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      await retrieveLostData();
    } else {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();

    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _images.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadImage() async {
    List<String> imagesTemp = [];

    for (var img in _images) {
      String fileName = basename(img.path);

      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref(fileName);

      // Kita ikuti aja kodingan pak Erico di BWA Flutix (kayak diatas) tapi dengan versi terbaru
      // sesuai dengan yang di dokumentasi

      /* Kita gatau ini kenapa malah manggil firebase_core, pas kita bikin firebase_storage juga ga error tapi
      kita ikutin yang di dokumentasi aja */

      try {
        await ref.putFile(img).then((value) =>
            value.ref.getDownloadURL().then((url) => imagesTemp.add(url)));
      } on firebase_core.FirebaseException catch (e) {
        print('ERROR: $e');
      }
    }

    imagesURL = imagesTemp;
  }
}
