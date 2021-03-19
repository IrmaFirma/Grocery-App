import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Store {
  Store(this.name, this.address, [this.reference]);

  final String name;
  final String address;
  DocumentReference reference;

  String get storeId => reference.id;


  Map<String, dynamic> toMap() {
    return {
      'name':name,
      'address':address
    };
  }

  factory Store.fromSnapshot(QueryDocumentSnapshot doc){
    return Store(doc['name'], doc['address'], doc.reference);
  }
}
