import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import '../schemas/item.dart';

class ItemService {
  final Configuration _config =
      Configuration([Item.schema], readOnly: false, inMemory: false);
  late Realm _realm;

  ItemService() {
    openRealm();
  }

  openRealm() {
    // Realm.deleteRealm(Configuration.defaultPath);
    _realm = Realm(_config);
  }

  closeRealm() {
    if (!_realm.isClosed) {
      _realm.close();
    }
  }

  RealmResults<Item> getItems() {
    return _realm.all<Item>();
  }

  bool addItem(String text) {
    try {
      _realm.write(() {
        _realm.add<Item>(Item(text, false));
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool toggleItemStatus(Item item) {
    try {
      _realm.write(() {
        item.done = !item.done;
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool deleteItem(Item item) {
    try {
      _realm.write(() {
        _realm.delete(item);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
}
