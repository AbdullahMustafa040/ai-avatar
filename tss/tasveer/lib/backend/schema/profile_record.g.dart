// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileRecord> _$profileRecordSerializer =
    new _$ProfileRecordSerializer();

class _$ProfileRecordSerializer implements StructuredSerializer<ProfileRecord> {
  @override
  final Iterable<Type> types = const [ProfileRecord, _$ProfileRecord];
  @override
  final String wireName = 'ProfileRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.editedTime;
    if (value != null) {
      result
        ..add('edited_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.bundleId;
    if (value != null) {
      result
        ..add('bundle_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgUrls;
    if (value != null) {
      result
        ..add('img_urls')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.done;
    if (value != null) {
      result
        ..add('done')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.used;
    if (value != null) {
      result
        ..add('used')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.noOfAvatar;
    if (value != null) {
      result
        ..add('no_of_avatar')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.profileCompleted;
    if (value != null) {
      result
        ..add('profile_completed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ProfileRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'edited_time':
          result.editedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'bundle_id':
          result.bundleId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img_urls':
          result.imgUrls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'done':
          result.done = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'used':
          result.used = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'no_of_avatar':
          result.noOfAvatar = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'profile_completed':
          result.profileCompleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileRecord extends ProfileRecord {
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final DateTime? editedTime;
  @override
  final DocumentReference<Object?>? userId;
  @override
  final DocumentReference<Object?>? bundleId;
  @override
  final String? gender;
  @override
  final BuiltList<String>? imgUrls;
  @override
  final bool? done;
  @override
  final int? used;
  @override
  final int? noOfAvatar;
  @override
  final bool? profileCompleted;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProfileRecord([void Function(ProfileRecordBuilder)? updates]) =>
      (new ProfileRecordBuilder()..update(updates))._build();

  _$ProfileRecord._(
      {this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.editedTime,
      this.userId,
      this.bundleId,
      this.gender,
      this.imgUrls,
      this.done,
      this.used,
      this.noOfAvatar,
      this.profileCompleted,
      this.ffRef})
      : super._();

  @override
  ProfileRecord rebuild(void Function(ProfileRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileRecordBuilder toBuilder() => new ProfileRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileRecord &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        editedTime == other.editedTime &&
        userId == other.userId &&
        bundleId == other.bundleId &&
        gender == other.gender &&
        imgUrls == other.imgUrls &&
        done == other.done &&
        used == other.used &&
        noOfAvatar == other.noOfAvatar &&
        profileCompleted == other.profileCompleted &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, editedTime.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, bundleId.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, imgUrls.hashCode);
    _$hash = $jc(_$hash, done.hashCode);
    _$hash = $jc(_$hash, used.hashCode);
    _$hash = $jc(_$hash, noOfAvatar.hashCode);
    _$hash = $jc(_$hash, profileCompleted.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileRecord')
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('editedTime', editedTime)
          ..add('userId', userId)
          ..add('bundleId', bundleId)
          ..add('gender', gender)
          ..add('imgUrls', imgUrls)
          ..add('done', done)
          ..add('used', used)
          ..add('noOfAvatar', noOfAvatar)
          ..add('profileCompleted', profileCompleted)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProfileRecordBuilder
    implements Builder<ProfileRecord, ProfileRecordBuilder> {
  _$ProfileRecord? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  DateTime? _editedTime;
  DateTime? get editedTime => _$this._editedTime;
  set editedTime(DateTime? editedTime) => _$this._editedTime = editedTime;

  DocumentReference<Object?>? _userId;
  DocumentReference<Object?>? get userId => _$this._userId;
  set userId(DocumentReference<Object?>? userId) => _$this._userId = userId;

  DocumentReference<Object?>? _bundleId;
  DocumentReference<Object?>? get bundleId => _$this._bundleId;
  set bundleId(DocumentReference<Object?>? bundleId) =>
      _$this._bundleId = bundleId;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  ListBuilder<String>? _imgUrls;
  ListBuilder<String> get imgUrls =>
      _$this._imgUrls ??= new ListBuilder<String>();
  set imgUrls(ListBuilder<String>? imgUrls) => _$this._imgUrls = imgUrls;

  bool? _done;
  bool? get done => _$this._done;
  set done(bool? done) => _$this._done = done;

  int? _used;
  int? get used => _$this._used;
  set used(int? used) => _$this._used = used;

  int? _noOfAvatar;
  int? get noOfAvatar => _$this._noOfAvatar;
  set noOfAvatar(int? noOfAvatar) => _$this._noOfAvatar = noOfAvatar;

  bool? _profileCompleted;
  bool? get profileCompleted => _$this._profileCompleted;
  set profileCompleted(bool? profileCompleted) =>
      _$this._profileCompleted = profileCompleted;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProfileRecordBuilder() {
    ProfileRecord._initializeBuilder(this);
  }

  ProfileRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _editedTime = $v.editedTime;
      _userId = $v.userId;
      _bundleId = $v.bundleId;
      _gender = $v.gender;
      _imgUrls = $v.imgUrls?.toBuilder();
      _done = $v.done;
      _used = $v.used;
      _noOfAvatar = $v.noOfAvatar;
      _profileCompleted = $v.profileCompleted;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileRecord;
  }

  @override
  void update(void Function(ProfileRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileRecord build() => _build();

  _$ProfileRecord _build() {
    _$ProfileRecord _$result;
    try {
      _$result = _$v ??
          new _$ProfileRecord._(
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              editedTime: editedTime,
              userId: userId,
              bundleId: bundleId,
              gender: gender,
              imgUrls: _imgUrls?.build(),
              done: done,
              used: used,
              noOfAvatar: noOfAvatar,
              profileCompleted: profileCompleted,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imgUrls';
        _imgUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProfileRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
