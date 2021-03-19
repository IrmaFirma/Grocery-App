import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store_item.dart';

class StoreItemViewModel {
  final StoreItem storeItem;

  StoreItemViewModel({this.storeItem});

  String get name => storeItem.name;

  String get storeItemId => storeItem.storeItemId;

  //TODO: Important

  factory StoreItemViewModel.fromSnapshot(QueryDocumentSnapshot doc) {
    final storeItem = StoreItem.fromSnapshot(doc);
    return StoreItemViewModel(storeItem: storeItem);
  }

}
