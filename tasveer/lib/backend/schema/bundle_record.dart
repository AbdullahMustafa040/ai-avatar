import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bundle_record.g.dart';

abstract class BundleRecord
    implements Built<BundleRecord, BundleRecordBuilder> {
  static Serializer<BundleRecord> get serializer => _$bundleRecordSerializer;

  String? get name;

  String? get description;

  double? get price;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  @BuiltValueField(wireName: 'on_sale')
  bool? get onSale;

  @BuiltValueField(wireName: 'sale_price')
  double? get salePrice;

  int? get quantity;

  @BuiltValueField(wireName: 'num_people')
  int? get numPeople;

  @BuiltValueField(wireName: 'num_avatars')
  int? get numAvatars;

  @BuiltValueField(wireName: 'num_images')
  int? get numImages;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BundleRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..price = 0.0
    ..onSale = false
    ..salePrice = 0.0
    ..quantity = 0
    ..numPeople = 0
    ..numAvatars = 0
    ..numImages = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bundle');

  static Stream<BundleRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BundleRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BundleRecord._();
  factory BundleRecord([void Function(BundleRecordBuilder) updates]) =
      _$BundleRecord;

  static BundleRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBundleRecordData({
  String? name,
  String? description,
  double? price,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? onSale,
  double? salePrice,
  int? quantity,
  int? numPeople,
  int? numAvatars,
  int? numImages,
}) {
  final firestoreData = serializers.toFirestore(
    BundleRecord.serializer,
    BundleRecord(
      (b) => b
        ..name = name
        ..description = description
        ..price = price
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..onSale = onSale
        ..salePrice = salePrice
        ..quantity = quantity
        ..numPeople = numPeople
        ..numAvatars = numAvatars
        ..numImages = numImages,
    ),
  );

  return firestoreData;
}
