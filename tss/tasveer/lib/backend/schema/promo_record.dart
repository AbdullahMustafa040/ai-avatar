import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promo_record.g.dart';

abstract class PromoRecord implements Built<PromoRecord, PromoRecordBuilder> {
  static Serializer<PromoRecord> get serializer => _$promoRecordSerializer;

  String? get name;

  String? get description;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  String? get title;

  int? get percentage;

  int? get price;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PromoRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..title = ''
    ..percentage = 0
    ..price = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promo');

  static Stream<PromoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromoRecord._();
  factory PromoRecord([void Function(PromoRecordBuilder) updates]) =
      _$PromoRecord;

  static PromoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromoRecordData({
  String? name,
  String? description,
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? title,
  int? percentage,
  int? price,
}) {
  final firestoreData = serializers.toFirestore(
    PromoRecord.serializer,
    PromoRecord(
      (p) => p
        ..name = name
        ..description = description
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..title = title
        ..percentage = percentage
        ..price = price,
    ),
  );

  return firestoreData;
}
