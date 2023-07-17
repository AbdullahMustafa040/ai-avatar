import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'guidelines_record.g.dart';

abstract class GuidelinesRecord
    implements Built<GuidelinesRecord, GuidelinesRecordBuilder> {
  static Serializer<GuidelinesRecord> get serializer =>
      _$guidelinesRecordSerializer;

  int? get id;

  String? get category;

  @BuiltValueField(wireName: 'TextGuideline')
  String? get textGuideline;

  String? get image;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GuidelinesRecordBuilder builder) => builder
    ..id = 0
    ..category = ''
    ..textGuideline = ''
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guidelines');

  static Stream<GuidelinesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GuidelinesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GuidelinesRecord._();
  factory GuidelinesRecord([void Function(GuidelinesRecordBuilder) updates]) =
      _$GuidelinesRecord;

  static GuidelinesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGuidelinesRecordData({
  int? id,
  String? category,
  String? textGuideline,
  String? image,
}) {
  final firestoreData = serializers.toFirestore(
    GuidelinesRecord.serializer,
    GuidelinesRecord(
      (g) => g
        ..id = id
        ..category = category
        ..textGuideline = textGuideline
        ..image = image,
    ),
  );

  return firestoreData;
}
