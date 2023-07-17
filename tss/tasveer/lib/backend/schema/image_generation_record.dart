import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'image_generation_record.g.dart';

abstract class ImageGenerationRecord
    implements Built<ImageGenerationRecord, ImageGenerationRecordBuilder> {
  static Serializer<ImageGenerationRecord> get serializer =>
      _$imageGenerationRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  @BuiltValueField(wireName: 'prompt_id')
  DocumentReference? get promptId;

  @BuiltValueField(wireName: 'image_url')
  BuiltList<String>? get imageUrl;

  String? get status;

  @BuiltValueField(wireName: 'tune_id')
  int? get tuneId;

  @BuiltValueField(wireName: 'astria_prompt_id')
  int? get astriaPromptId;

  int? get rating;

  String? get comment;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ImageGenerationRecordBuilder builder) =>
      builder
        ..imageUrl = ListBuilder()
        ..status = ''
        ..tuneId = 0
        ..astriaPromptId = 0
        ..rating = 0
        ..comment = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('image_generation')
          : FirebaseFirestore.instance.collectionGroup('image_generation');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('image_generation').doc();

  static Stream<ImageGenerationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ImageGenerationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ImageGenerationRecord._();
  factory ImageGenerationRecord(
          [void Function(ImageGenerationRecordBuilder) updates]) =
      _$ImageGenerationRecord;

  static ImageGenerationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createImageGenerationRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  DocumentReference? promptId,
  String? status,
  int? tuneId,
  int? astriaPromptId,
  int? rating,
  String? comment,
}) {
  final firestoreData = serializers.toFirestore(
    ImageGenerationRecord.serializer,
    ImageGenerationRecord(
      (i) => i
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..promptId = promptId
        ..imageUrl = null
        ..status = status
        ..tuneId = tuneId
        ..astriaPromptId = astriaPromptId
        ..rating = rating
        ..comment = comment,
    ),
  );

  return firestoreData;
}
