part of 'services.dart';

class GadgetServices {
  //FireStore versi lama
  // static CollectionReference gadgetCollection =
  //     Firestore.instance.collection('gadget');

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference gadgets = firestore.collection('gadgets');

  static Future<void> addGadget(Gadget gadget,
      {required List<String> photos}) async {
    // FireStore versi lama
    // String id = gadgetCollection.document().documentID.toString();

    // Nyoba2
    // Future<DocumentSnapshot> id = gadgets.doc(id).get();

    // Nyoba2
    // DocumentReference docRef = await gadgets.add(map).;

    // code lama
    // await gadgetCollection.document(id).setData({
    //   'price': gadget.price,
    //   'name': gadget.name,
    //   'city': gadget.city ?? 'Padangsidimpuan',
    //   'phone': gadget.phone,
    //   'mapURL': gadget.mapURL ?? 'https://goo.gl/maps/jqBp6ctcPs3pAff88',
    //   'address': gadget.address,
    //   'battery': gadget.battery,
    //   'screen': gadget.screen,
    //   'camera': gadget.camera,
    //   'chipset': gadget.chipset,
    //   'chipset_series': gadget.chipsetSeries,
    //   'desc': gadget.desc ?? '',
    //   'seller': gadget.seller,
    //   'photos': photos,
    //   'gadget_id': id,
    // });

    String id = gadgets.doc().id;

    gadgets.doc(id).set({
      'price': gadget.price,
      'name': gadget.name,
      'city': gadget.city ?? 'Padangsidimpuan',
      'phone': gadget.phone,
      'mapURL': gadget.mapURL ?? 'https://goo.gl/maps/jqBp6ctcPs3pAff88',
      'address': gadget.address,
      'battery': gadget.battery,
      'screen': gadget.screen,
      'camera': gadget.camera,
      'chipset': gadget.chipset,
      'chipset_series': gadget.chipsetSeries,
      'desc': gadget.desc ?? '',
      'seller': gadget.seller,
      'photos': photos,
      'gadget_id': id
    });
  }

  static Future<List<Gadget>> getGadgets() async {
    // Kodingan lama
    // QuerySnapshot snapshot = await gadgetCollection.getDocuments();
    // List<DocumentSnapshot> documents = snapshot.documents;

    // FirebaseFirestore.instance
    // .collection('users')
    // .get()
    // .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //         print(doc["first_name"]);
    //     });
    // });

    List<Gadget> listGadgets = [];

    await gadgets.get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
              listGadgets.add(Gadget(
                  price: doc.data()!['price'],
                  name: doc.data()!['name'],
                  city: doc.data()!['city'],
                  phone: doc.data()!['phone'],
                  mapURL: doc.data()!['mapURL'],
                  address: doc.data()!['address'],
                  battery: doc.data()!['battery'],
                  screen: doc.data()!['screen'],
                  camera: doc.data()!['camera'],
                  chipset: doc.data()!['chipset'],
                  chipsetSeries: doc.data()!['chipset_series'],
                  desc: doc.data()!['desc'],
                  seller: doc.data()!['seller'],
                  photos: doc.data()!['photos'],
                  gadgetID: doc.data()!['gadget_id']));
            }));

    return listGadgets;

    // Ini code kita pas mau nyoba ngambil documentID tiap gadget yang mau dibuat di page favorit
    // Iterable<DocumentSnapshot> documentsLove = snapshot.documents;

    // if (isForLovePage == true) {
    //   for (var item in inLovePage) {
    //     documentsLove = snapshot.documents
    //         .where((document) => document.data['gadget_id'] == item);
    //   }
    // }

    // Kodingan lama
    // List<Gadget> gadgets = [];

    // for (var document in documents) {
    //   gadgets.add(Gadget(
    //       price: document.data['price'],
    //       name: document.data['name'],
    //       city: document.data['city'],
    //       phone: document.data['phone'],
    //       mapURL: document.data['mapURL'],
    //       address: document.data['address'],
    //       battery: document.data['battery'],
    //       screen: document.data['screen'],
    //       camera: document.data['camera'],
    //       chipset: document.data['chipset'],
    //       chipsetSeries: document.data['chipset_series'],
    //       desc: document.data['desc'],
    //       seller: document.data['seller'],
    //       photos: document.data['photos'],
    //       gadgetID: document.data['gadget_id']));
    // }

    // return gadgets;
  }

  // kodingan dari BWA Cozy
  // getRecommendedGadget() async {
  //   var response =
  //       await http.get('http://bwa-cozy.herokuapp.com/recommended-gadgets');

  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     List data = jsonDecode(response.body);

  //     List<Gadget> gadgets = data.map((e) => Gadget.fromJson(e)).toList();
  //     return gadgets;
  //   } else {
  //     return <Gadget>[];
  //   }
  // }
}
