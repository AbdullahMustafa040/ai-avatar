// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guidelines_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GuidelinesRecord> _$guidelinesRecordSerializer =
    new _$GuidelinesRecordSerializer();

class _$GuidelinesRecordSerializer
    implements StructuredSerializer<GuidelinesRecord> {
  @override
  final Iterable<Type> types = const [GuidelinesRecord, _$GuidelinesRecord];
  @override
  final String wireName = 'GuidelinesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GuidelinesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.textGuideline;
    if (value != null) {
      result
        ..add('TextGuideline')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
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
  GuidelinesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GuidelinesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'TextGuideline':
          result.textGuideline = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
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

class _$GuidelinesRecord extends GuidelinesRecord {
  @override
  final int? id;
  @override
  final String? category;
  @override
  final String? textGuideline;
  @override
  final String? image;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GuidelinesRecord(
          [void Function(GuidelinesRecordBuilder)? updates]) =>
      (new GuidelinesRecordBuilder()..update(updates))._build();

  _$GuidelinesRecord._(
      {this.id, this.category, this.textGuideline, this.image, this.ffRef})
      : super._();

  @override
  GuidelinesRecord rebuild(void Function(GuidelinesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GuidelinesRecordBuilder toBuilder() =>
      new GuidelinesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GuidelinesRecord &&
        id == other.id &&
        category == other.category &&
        textGuideline == other.textGuideline &&
        image == other.image &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, textGuideline.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GuidelinesRecord')
          ..add('id', id)
          ..add('category', category)
          ..add('textGuideline', textGuideline)
          ..add('image', image)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GuidelinesRecordBuilder
    implements Builder<GuidelinesRecord, GuidelinesRecordBuilder> {
  _$GuidelinesRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _textGuideline;
  String? get textGuideline => _$this._textGuideline;
  set textGuideline(String? textGuideline) =>
      _$this._textGuideline = textGuideline;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GuidelinesRecordBuilder() {
    GuidelinesRecord._initializeBuilder(this);
  }

  GuidelinesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _category = $v.category;
      _textGuideline = $v.textGuideline;
      _image = $v.image;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GuidelinesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GuidelinesRecord;
  }

  @override
  void update(void Function(GuidelinesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GuidelinesRecord build() => _build();

  _$GuidelinesRecord _build() {
    final _$result = _$v ??
        new _$GuidelinesRecord._(
            id: id,
            category: category,
            textGuideline: textGuideline,
            image: image,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
