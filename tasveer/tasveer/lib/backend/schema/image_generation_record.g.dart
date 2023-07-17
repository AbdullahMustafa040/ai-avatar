// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageGenerationRecord> _$imageGenerationRecordSerializer =
    new _$ImageGenerationRecordSerializer();

class _$ImageGenerationRecordSerializer
    implements StructuredSerializer<ImageGenerationRecord> {
  @override
  final Iterable<Type> types = const [
    ImageGenerationRecord,
    _$ImageGenerationRecord
  ];
  @override
  final String wireName = 'ImageGenerationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ImageGenerationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.promptId;
    if (value != null) {
      result
        ..add('prompt_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
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
    value = object.tuneId;
    if (value != null) {
      result
        ..add('tune_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.astriaPromptId;
    if (value != null) {
      result
        ..add('astria_prompt_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ImageGenerationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageGenerationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_at':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'prompt_id':
          result.promptId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'image_url':
          result.imageUrl.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tune_id':
          result.tuneId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'astria_prompt_id':
          result.astriaPromptId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ImageGenerationRecord extends ImageGenerationRecord {
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final DocumentReference<Object?>? promptId;
  @override
  final BuiltList<String>? imageUrl;
  @override
  final String? status;
  @override
  final int? tuneId;
  @override
  final int? astriaPromptId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ImageGenerationRecord(
          [void Function(ImageGenerationRecordBuilder)? updates]) =>
      (new ImageGenerationRecordBuilder()..update(updates))._build();

  _$ImageGenerationRecord._(
      {this.createdAt,
      this.modifiedAt,
      this.promptId,
      this.imageUrl,
      this.status,
      this.tuneId,
      this.astriaPromptId,
      this.ffRef})
      : super._();

  @override
  ImageGenerationRecord rebuild(
          void Function(ImageGenerationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageGenerationRecordBuilder toBuilder() =>
      new ImageGenerationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageGenerationRecord &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        promptId == other.promptId &&
        imageUrl == other.imageUrl &&
        status == other.status &&
        tuneId == other.tuneId &&
        astriaPromptId == other.astriaPromptId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, modifiedAt.hashCode);
    _$hash = $jc(_$hash, promptId.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, tuneId.hashCode);
    _$hash = $jc(_$hash, astriaPromptId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImageGenerationRecord')
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('promptId', promptId)
          ..add('imageUrl', imageUrl)
          ..add('status', status)
          ..add('tuneId', tuneId)
          ..add('astriaPromptId', astriaPromptId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ImageGenerationRecordBuilder
    implements Builder<ImageGenerationRecord, ImageGenerationRecordBuilder> {
  _$ImageGenerationRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  DocumentReference<Object?>? _promptId;
  DocumentReference<Object?>? get promptId => _$this._promptId;
  set promptId(DocumentReference<Object?>? promptId) =>
      _$this._promptId = promptId;

  ListBuilder<String>? _imageUrl;
  ListBuilder<String> get imageUrl =>
      _$this._imageUrl ??= new ListBuilder<String>();
  set imageUrl(ListBuilder<String>? imageUrl) => _$this._imageUrl = imageUrl;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _tuneId;
  int? get tuneId => _$this._tuneId;
  set tuneId(int? tuneId) => _$this._tuneId = tuneId;

  int? _astriaPromptId;
  int? get astriaPromptId => _$this._astriaPromptId;
  set astriaPromptId(int? astriaPromptId) =>
      _$this._astriaPromptId = astriaPromptId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ImageGenerationRecordBuilder() {
    ImageGenerationRecord._initializeBuilder(this);
  }

  ImageGenerationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _promptId = $v.promptId;
      _imageUrl = $v.imageUrl?.toBuilder();
      _status = $v.status;
      _tuneId = $v.tuneId;
      _astriaPromptId = $v.astriaPromptId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageGenerationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImageGenerationRecord;
  }

  @override
  void update(void Function(ImageGenerationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImageGenerationRecord build() => _build();

  _$ImageGenerationRecord _build() {
    _$ImageGenerationRecord _$result;
    try {
      _$result = _$v ??
          new _$ImageGenerationRecord._(
              createdAt: createdAt,
              modifiedAt: modifiedAt,
              promptId: promptId,
              imageUrl: _imageUrl?.build(),
              status: status,
              tuneId: tuneId,
              astriaPromptId: astriaPromptId,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imageUrl';
        _imageUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ImageGenerationRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
