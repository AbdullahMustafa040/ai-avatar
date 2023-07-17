import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'profile_record.g.dart';

abstract class ProfileRecord
    implements Built<ProfileRecord, ProfileRecordBuilder> {
  static Serializer<ProfileRecord> get serializer => _$profileRecordSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'edited_time')
  DateTime? get editedTime;

  @BuiltValueField(wireName: 'user_id')
  DocumentReference? get userId;

  @BuiltValueField(wireName: 'bundle_id')
  DocumentReference? get bundleId;

  String? get gender;

  @BuiltValueField(wireName: 'img_urls')
  BuiltList<String>? get imgUrls;

  bool? get done;

  int? get used;

  @BuiltValueField(wireName: 'no_of_avatar')
  int? get noOfAvatar;

  @BuiltValueField(wireName: 'profile_completed')
  bool? get profileCompleted;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProfileRecordBuilder builder) => builder
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..gender = ''
    ..imgUrls = ListBuilder()
    ..done = false
    ..used = 0
    ..noOfAvatar = 0
    ..profileCompleted = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profile');

  static Stream<ProfileRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProfileRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProfileRecord._();
  factory ProfileRecord([void Function(ProfileRecordBuilder) updates]) =
      _$ProfileRecord;

  static ProfileRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProfileRecordData({
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  DateTime? editedTime,
  DocumentReference? userId,
  DocumentReference? bundleId,
  String? gender,
  bool? done,
  int? used,
  int? noOfAvatar,
  bool? profileCompleted,
}) {
  final firestoreData = serializers.toFirestore(
    ProfileRecord.serializer,
    ProfileRecord(
      (p) => p
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..editedTime = editedTime
        ..userId = userId
        ..bundleId = bundleId
        ..gender = gender
        ..imgUrls = null
        ..done = done
        ..used = used
        ..noOfAvatar = noOfAvatar
        ..profileCompleted = profileCompleted,
    ),
  );

  return firestoreData;
}
