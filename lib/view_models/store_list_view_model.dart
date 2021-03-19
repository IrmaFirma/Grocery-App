import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/view_models/store_view_model.dart';

class StoreListViewModel {


  Stream<QuerySnapshot> get storesAsStream{
    return FirebaseFirestore.instance.collection('stores').snapshots();
  }

  void deleteStore(StoreViewModel store){
    FirebaseFirestore.instance.collection('stores').doc(store.storeId).delete();
    FirebaseFirestore.instance.collection('stores').doc(store.storeId).collection('items').get().then((value) => {
      for(DocumentSnapshot ds in value.docs){
        ds.reference.delete(),
      }
    });
  }



}