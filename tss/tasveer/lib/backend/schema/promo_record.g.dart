// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromoRecord> _$promoRecordSerializer = new _$PromoRecordSerializer();

class _$PromoRecordSerializer implements StructuredSerializer<PromoRecord> {
  @override
  final Iterable<Type> types = const [PromoRecord, _$PromoRecord];
  @override
  final String wireName = 'PromoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromoRecord object,
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.percentage;
    if (value != null) {
      result
        ..add('percentage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
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
  PromoRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromoRecordBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'percentage':
          result.percentage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
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

class _$PromoRecord extends PromoRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final String? title;
  @override
  final int? percentage;
  @override
  final int? price;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromoRecord([void Function(PromoRecordBuilder)? updates]) =>
      (new PromoRecordBuilder()..update(updates))._build();

  _$PromoRecord._(
      {this.name,
      this.description,
      this.createdAt,
      this.modifiedAt,
      this.title,
      this.percentage,
      this.price,
      this.ffRef})
      : super._();

  @override
  PromoRecord rebuild(void Function(PromoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromoRecordBuilder toBuilder() => new PromoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromoRecord &&
        name == other.name &&
        description == other.description &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        title == other.title &&
        percentage == other.percentage &&
        price == other.price &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, modifiedAt.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, percentage.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromoRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('title', title)
          ..add('percentage', percentage)
          ..add('price', price)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromoRecordBuilder implements Builder<PromoRecord, PromoRecordBuilder> {
  _$PromoRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _percentage;
  int? get percentage => _$this._percentage;
  set percentage(int? percentage) => _$this._percentage = percentage;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromoRecordBuilder() {
    PromoRecord._initializeBuilder(this);
  }

  PromoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _title = $v.title;
      _percentage = $v.percentage;
      _price = $v.price;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromoRecord;
  }

  @override
  void update(void Function(PromoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromoRecord build() => _build();

  _$PromoRecord _build() {
    final _$result = _$v ??
        new _$PromoRecord._(
            name: name,
            description: description,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
            title: title,
            percentage: percentage,
            price: price,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
