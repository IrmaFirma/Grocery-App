import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/models/store.dart';

class AddStoreViewModel extends ChangeNotifier {
  String storeName = '';
  String storeAddress = '';
  String message = '';

  Future<bool> saveStore() async {
    bool isSaved = false;
    final store = Store(storeName, storeAddress);
    try {
      await FirebaseFirestore.instance.collection('stores').add(store.toMap());
      isSaved = true;
      message = 'Store saved';
    } on Exception catch (e) {
      message = 'Unable to save the store';
    } catch (e) {
      message = 'Error ocurred';
    }

    notifyListeners();
    return isSaved;
  }
}
