part of 'services.dart';

class GadgetServices {
  static CollectionReference gadgetCollection =
      Firestore.instance.collection('gadget');

  static Future<void> addGadget(Gadget gadget, {List<String> photos}) async {
    String id = gadgetCollection.document().documentID.toString();

    await gadgetCollection.document(id).setData({
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
      'gadget_id': id,
    });
  }

  static Future<List<Gadget>> getGadget() async {
    QuerySnapshot snapshot = await gadgetCollection.getDocuments();

    List<DocumentSnapshot> documents = snapshot.documents;
    // Iterable<DocumentSnapshot> documentsLove = snapshot.documents;

    // if (isForLovePage == true) {
    //   for (var item in inLovePage) {
    //     documentsLove = snapshot.documents
    //         .where((document) => document.data['gadget_id'] == item);
    //   }
    // }

    List<Gadget> gadgets = [];

    for (var document in documents) {
      gadgets.add(Gadget(
          price: document.data['price'],
          name: document.data['name'],
          city: document.data['city'],
          phone: document.data['phone'],
          mapURL: document.data['mapURL'],
          address: document.data['address'],
          battery: document.data['battery'],
          screen: document.data['screen'],
          camera: document.data['camera'],
          chipset: document.data['chipset'],
          chipsetSeries: document.data['chipset_series'],
          desc: document.data['desc'],
          seller: document.data['seller'],
          photos: document.data['photos'],
          gadgetID: document.data['gadget_id']));
    }

    return gadgets;
  }

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
