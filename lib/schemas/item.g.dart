// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Item extends _Item with RealmEntity, RealmObject {
  Item(
    String text,
    bool done,
  ) {
    RealmObject.set(this, 'text', text);
    RealmObject.set(this, 'done', done);
  }

  Item._();

  @override
  String get text => RealmObject.get<String>(this, 'text') as String;
  @override
  set text(String value) => throw RealmUnsupportedSetError();

  @override
  bool get done => RealmObject.get<bool>(this, 'done') as bool;
  @override
  set done(bool value) => RealmObject.set(this, 'done', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObject.getChanges<Item>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Item._);
    return const SchemaObject(Item, [
      SchemaProperty('text', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('done', RealmPropertyType.bool),
    ]);
  }
}
