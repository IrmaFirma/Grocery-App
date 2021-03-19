import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/store_item.dart';
import 'package:grocery_app/view_models/store_item_view_model.dart';
import 'package:grocery_app/view_models/store_view_model.dart';

class StoreItemListViewModel {
  StoreItemListViewModel({@required this.store});

  String name;
  double price;
  int quantity;

  final StoreViewModel store;

  void saveStoreItem() {
    final storeItem = StoreItem(name, price, quantity);
    FirebaseFirestore.instance
        .collection('stores')
    //TODO: Important
        .doc(store.storeId)
        .collection('items')
        .add(storeItem.toMap());
  }

  void deleteStoreItem(StoreItemViewModel storeItem){
    FirebaseFirestore.instance.collection('stores').doc(store.storeId).collection('items').doc(storeItem.storeItemId).delete();
  }

  Stream<QuerySnapshot> get storeItemsAsStream{
    //TODO: Important
    return FirebaseFirestore.instance.collection('stores').doc(store.storeId).collection('items').snapshots();
  }
}
