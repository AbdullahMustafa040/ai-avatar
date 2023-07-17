import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'avatars_record.g.dart';

abstract class AvatarsRecord
    implements Built<AvatarsRecord, AvatarsRecordBuilder> {
  static Serializer<AvatarsRecord> get serializer => _$avatarsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  @BuiltValueField(wireName: 'ckpt_url')
  String? get ckptUrl;

  int? get steps;

  String? get token;

  String? get title;

  @BuiltValueField(wireName: 'tune_id')
  int? get tuneId;

  @BuiltValueField(wireName: 'upload_images')
  BuiltList<String>? get uploadImages;

  String? get status;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AvatarsRecordBuilder builder) => builder
    ..name = ''
    ..ckptUrl = ''
    ..steps = 0
    ..token = ''
    ..title = ''
    ..tuneId = 0
    ..uploadImages = ListBuilder()
    ..status = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('avatars')
          : FirebaseFirestore.instance.collectionGroup('avatars');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('avatars').doc();

  static Stream<AvatarsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AvatarsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AvatarsRecord._();
  factory AvatarsRecord([void Function(AvatarsRecordBuilder) updates]) =
      _$AvatarsRecord;

  static AvatarsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAvatarsRecordData({
  String? name,
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? ckptUrl,
  int? steps,
  String? token,
  String? title,
  int? tuneId,
  String? status,
}) {
  final firestoreData = serializers.toFirestore(
    AvatarsRecord.serializer,
    AvatarsRecord(
      (a) => a
        ..name = name
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..ckptUrl = ckptUrl
        ..steps = steps
        ..token = token
        ..title = title
        ..tuneId = tuneId
        ..uploadImages = null
        ..status = status,
    ),
  );

  return firestoreData;
}
