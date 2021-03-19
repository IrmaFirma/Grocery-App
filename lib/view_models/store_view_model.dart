import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store.dart';

class StoreViewModel {
  StoreViewModel({this.store});

  final Store store;

  String get storeId => store.storeId;

  String get name => store.name;

  String get address => store.address;

  Future<int> get itemsCountAsync async {
    final data =  await store.reference.collection('items').get();
    return data.docs.length;
  }



  factory StoreViewModel.fromSnapshot(QueryDocumentSnapshot doc){
    final store = Store.fromSnapshot(doc);
    return StoreViewModel(store: store);
  }
}
