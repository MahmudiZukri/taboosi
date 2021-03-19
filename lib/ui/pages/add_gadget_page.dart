part of 'pages.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // final MoneyMaskedTextController priceController = MoneyMaskedTextController(
  //     leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
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
  // final TextEditingController sellerController = TextEditingController();
  final TextEditingController sellerController = TextEditingController();

  List<File> _images = [];
  final picker = ImagePicker();
  List<String> imagesURL = [];
  bool isUploading = false;

  // int selectedPrice = 0;

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
                    labelText: 'Nama Produk',
                    hintText: 'e.g. Xiaomi Mi 11 6/64',
                  ),
                  TextfieldCard(
                      controller: priceController,
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
                      labelText: 'Daya Baterai (mAh)',
                      hintText: 'e.g. 4000',
                      inputNumber: true),
                  TextfieldCard(
                      controller: screenController,
                      labelText: 'Ukuran Layar (inch)',
                      hintText: 'e.g. 6,53',
                      inputNumber: true),
                  TextfieldCard(
                      controller: cameraController,
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
                          labelText: 'Chipset series',
                          hintText: 'e.g. Helio G90T',
                          width: (MediaQuery.of(context).size.width -
                                  2 * edge -
                                  15) /
                              2),
                    ],
                  ),
                  TextfieldCard(
                    controller: descController,
                    height: 100,
                    maxLines: 3,
                    labelText: 'Keterangan Tambahan untuk Produk',
                  ),
                  TextfieldCard(
                    controller: sellerController,
                    labelText: 'Nama Penjual',
                  ),
                  TextfieldCard(
                    controller: phoneController,
                    labelText: 'No. Handphone',
                    hintText: 'e.g. 0821********',
                    inputNumber: true,
                  ),
                  TextfieldCard(
                    controller: addressController,
                    labelText: 'Alamat COD',
                    hintText: 'e.g. Jl. Sutan Soripada Mulia ...',
                  ),
                  TextfieldCard(
                    controller: cityController,
                    labelText: 'Kota',
                    hintText: 'e.g. Padangsidimpuan',
                  ),
                  Text(
                    'Upload Foto Produk',
                    style: greyTextFont,
                  ),
                  Text('Note: Foto yang pertama akan menjadi thumbnail',
                      style: greyTextFont.copyWith(
                          fontSize: 10, color: Colors.grey[300])),
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
                                              Flushbar(
                                                  duration: Duration(
                                                      milliseconds: 1500),
                                                  flushbarPosition:
                                                      FlushbarPosition.TOP,
                                                  backgroundColor:
                                                      Colors.red[400],
                                                  icon: Icon(Icons.dangerous,
                                                      color: Colors.white),
                                                  message:
                                                      'Upload foto produk masksimal 8')
                                                ..show(context);
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
                            : RaisedButton(
                                color: turquoiseColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17)),
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
                                    Flushbar(
                                        duration: Duration(milliseconds: 1500),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Colors.red[400],
                                        icon: Icon(Icons.dangerous,
                                            color: Colors.white),
                                        message: 'Tolong isi semua field')
                                      ..show(context);
                                  } else if (_images.length < 3) {
                                    Flushbar(
                                        duration: Duration(milliseconds: 1500),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Colors.red[400],
                                        icon: Icon(Icons.dangerous,
                                            color: Colors.white),
                                        message: 'Upload foto produk minimal 3')
                                      ..show(context);
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
                                            seller: sellerController.text
                                            // seller: sellerController.text,
                                            ),
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

                                    Flushbar(
                                        duration: Duration(milliseconds: 1500),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Colors.green[400],
                                        icon: Icon(Icons.check_box,
                                            color: Colors.white),
                                        message: 'Produk berhasil diupload')
                                      ..show(context);
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
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      await retrieveLostData();
    } else {
      setState(() {
        _images.add(File(pickedFile?.path));
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
        _images.add(File(response.file.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadImage() async {
    List<String> imagetemps = [];

    for (var img in _images) {
      String fileName = basename(img.path);
      StorageReference ref = FirebaseStorage.instance.ref().child(fileName);

      StorageUploadTask task = ref.putFile(img);

      StorageTaskSnapshot snapshot = await task.onComplete;

      await snapshot.ref
          .getDownloadURL()
          .then((value) => imagetemps.add(value));
    }

    imagesURL = imagetemps;
  }
}
