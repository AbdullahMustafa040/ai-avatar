// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatars_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AvatarsRecord> _$avatarsRecordSerializer =
    new _$AvatarsRecordSerializer();

class _$AvatarsRecordSerializer implements StructuredSerializer<AvatarsRecord> {
  @override
  final Iterable<Type> types = const [AvatarsRecord, _$AvatarsRecord];
  @override
  final String wireName = 'AvatarsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AvatarsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedAt;
    if (value != null) {
      result
        ..add('modified_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ckptUrl;
    if (value != null) {
      result
        ..add('ckpt_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.steps;
    if (value != null) {
      result
        ..add('steps')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tuneId;
    if (value != null) {
      result
        ..add('tune_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.uploadImages;
    if (value != null) {
      result
        ..add('upload_images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  AvatarsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AvatarsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_at':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'ckpt_url':
          result.ckptUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'steps':
          result.steps = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tune_id':
          result.tuneId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'upload_images':
          result.uploadImages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$AvatarsRecord extends AvatarsRecord {
  @override
  final String? name;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final String? ckptUrl;
  @override
  final int? steps;
  @override
  final String? token;
  @override
  final String? title;
  @override
  final int? tuneId;
  @override
  final BuiltList<String>? uploadImages;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AvatarsRecord([void Function(AvatarsRecordBuilder)? updates]) =>
      (new AvatarsRecordBuilder()..update(updates))._build();

  _$AvatarsRecord._(
      {this.name,
      this.createdAt,
      this.modifiedAt,
      this.ckptUrl,
      this.steps,
      this.token,
      this.title,
      this.tuneId,
      this.uploadImages,
      this.status,
      this.ffRef})
      : super._();

  @override
  AvatarsRecord rebuild(void Function(AvatarsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvatarsRecordBuilder toBuilder() => new AvatarsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvatarsRecord &&
        name == other.name &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        ckptUrl == other.ckptUrl &&
        steps == other.steps &&
        token == other.token &&
        title == other.title &&
        tuneId == other.tuneId &&
        uploadImages == other.uploadImages &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, modifiedAt.hashCode);
    _$hash = $jc(_$hash, ckptUrl.hashCode);
    _$hash = $jc(_$hash, steps.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, tuneId.hashCode);
    _$hash = $jc(_$hash, uploadImages.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AvatarsRecord')
          ..add('name', name)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('ckptUrl', ckptUrl)
          ..add('steps', steps)
          ..add('token', token)
          ..add('title', title)
          ..add('tuneId', tuneId)
          ..add('uploadImages', uploadImages)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AvatarsRecordBuilder
    implements Builder<AvatarsRecord, AvatarsRecordBuilder> {
  _$AvatarsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  String? _ckptUrl;
  String? get ckptUrl => _$this._ckptUrl;
  set ckptUrl(String? ckptUrl) => _$this._ckptUrl = ckptUrl;

  int? _steps;
  int? get steps => _$this._steps;
  set steps(int? steps) => _$this._steps = steps;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _tuneId;
  int? get tuneId => _$this._tuneId;
  set tuneId(int? tuneId) => _$this._tuneId = tuneId;

  ListBuilder<String>? _uploadImages;
  ListBuilder<String> get uploadImages =>
      _$this._uploadImages ??= new ListBuilder<String>();
  set uploadImages(ListBuilder<String>? uploadImages) =>
      _$this._uploadImages = uploadImages;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AvatarsRecordBuilder() {
    AvatarsRecord._initializeBuilder(this);
  }

  AvatarsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _ckptUrl = $v.ckptUrl;
      _steps = $v.steps;
      _token = $v.token;
      _title = $v.title;
      _tuneId = $v.tuneId;
      _uploadImages = $v.uploadImages?.toBuilder();
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AvatarsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AvatarsRecord;
  }

  @override
  void update(void Function(AvatarsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AvatarsRecord build() => _build();

  _$AvatarsRecord _build() {
    _$AvatarsRecord _$result;
    try {
      _$result = _$v ??
          new _$AvatarsRecord._(
              name: name,
              createdAt: createdAt,
              modifiedAt: modifiedAt,
              ckptUrl: ckptUrl,
              steps: steps,
              token: token,
              title: title,
              tuneId: tuneId,
              uploadImages: _uploadImages?.build(),
              status: status,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'uploadImages';
        _uploadImages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AvatarsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
