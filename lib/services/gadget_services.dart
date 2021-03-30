part of 'services.dart';

class GadgetServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference gadgets = firestore.collection('gadgets');

  static Future<void> addGadget(Gadget gadget,
      {required List<String> photos}) async {
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
  }
}
