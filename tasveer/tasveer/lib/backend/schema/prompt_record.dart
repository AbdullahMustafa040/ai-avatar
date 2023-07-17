import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'prompt_record.g.dart';

abstract class PromptRecord
    implements Built<PromptRecord, PromptRecordBuilder> {
  static Serializer<PromptRecord> get serializer => _$promptRecordSerializer;

  @BuiltValueField(wireName: 'AvatarName')
  String? get avatarName;

  @BuiltValueField(wireName: 'ControlnetInputImage')
  String? get controlnetInputImage;

  @BuiltValueField(wireName: 'PositivePrompt')
  String? get positivePrompt;

  @BuiltValueField(wireName: 'NegativePrompt')
  String? get negativePrompt;

  @BuiltValueField(wireName: 'Steps')
  int? get steps;

  @BuiltValueField(wireName: 'Seed')
  int? get seed;

  @BuiltValueField(wireName: 'AspectRatio')
  String? get aspectRatio;

  @BuiltValueField(wireName: 'FaceCorrection')
  bool? get faceCorrection;

  @BuiltValueField(wireName: 'Super-resolution')
  bool? get superResolution;

  String? get category;

  @BuiltValueField(wireName: 'MainImage')
  String? get mainImage;

  @BuiltValueField(wireName: 'Paragraph')
  String? get paragraph;

  @BuiltValueField(wireName: 'CFG')
  double? get cfg;

  @BuiltValueField(wireName: 'AvatarPosterPhoto')
  String? get avatarPosterPhoto;

  @BuiltValueField(wireName: 'controlnet_hint')
  String? get controlnetHint;

  String? get gender;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PromptRecordBuilder builder) => builder
    ..avatarName = ''
    ..controlnetInputImage = ''
    ..positivePrompt = ''
    ..negativePrompt = ''
    ..steps = 0
    ..seed = 0
    ..aspectRatio = ''
    ..faceCorrection = false
    ..superResolution = false
    ..category = ''
    ..mainImage = ''
    ..paragraph = ''
    ..cfg = 0.0
    ..avatarPosterPhoto = ''
    ..controlnetHint = ''
    ..gender = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prompt');

  static Stream<PromptRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromptRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromptRecord._();
  factory PromptRecord([void Function(PromptRecordBuilder) updates]) =
      _$PromptRecord;

  static PromptRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromptRecordData({
  String? avatarName,
  String? controlnetInputImage,
  String? positivePrompt,
  String? negativePrompt,
  int? steps,
  int? seed,
  String? aspectRatio,
  bool? faceCorrection,
  bool? superResolution,
  String? category,
  String? mainImage,
  String? paragraph,
  double? cfg,
  String? avatarPosterPhoto,
  String? controlnetHint,
  String? gender,
}) {
  final firestoreData = serializers.toFirestore(
    PromptRecord.serializer,
    PromptRecord(
      (p) => p
        ..avatarName = avatarName
        ..controlnetInputImage = controlnetInputImage
        ..positivePrompt = positivePrompt
        ..negativePrompt = negativePrompt
        ..steps = steps
        ..seed = seed
        ..aspectRatio = aspectRatio
        ..faceCorrection = faceCorrection
        ..superResolution = superResolution
        ..category = category
        ..mainImage = mainImage
        ..paragraph = paragraph
        ..cfg = cfg
        ..avatarPosterPhoto = avatarPosterPhoto
        ..controlnetHint = controlnetHint
        ..gender = gender,
    ),
  );

  return firestoreData;
}
