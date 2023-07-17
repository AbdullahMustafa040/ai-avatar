// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BundleRecord> _$bundleRecordSerializer =
    new _$BundleRecordSerializer();

class _$BundleRecordSerializer implements StructuredSerializer<BundleRecord> {
  @override
  final Iterable<Type> types = const [BundleRecord, _$BundleRecord];
  @override
  final String wireName = 'BundleRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BundleRecord object,
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
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
    value = object.onSale;
    if (value != null) {
      result
        ..add('on_sale')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.salePrice;
    if (value != null) {
      result
        ..add('sale_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numPeople;
    if (value != null) {
      result
        ..add('num_people')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numAvatars;
    if (value != null) {
      result
        ..add('num_avatars')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numImages;
    if (value != null) {
      result
        ..add('num_images')
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
  BundleRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BundleRecordBuilder();

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
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_at':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'on_sale':
          result.onSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sale_price':
          result.salePrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_people':
          result.numPeople = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_avatars':
          result.numAvatars = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_images':
          result.numImages = serializers.deserialize(value,
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

class _$BundleRecord extends BundleRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? price;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final bool? onSale;
  @override
  final double? salePrice;
  @override
  final int? quantity;
  @override
  final int? numPeople;
  @override
  final int? numAvatars;
  @override
  final int? numImages;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BundleRecord([void Function(BundleRecordBuilder)? updates]) =>
      (new BundleRecordBuilder()..update(updates))._build();

  _$BundleRecord._(
      {this.name,
      this.description,
      this.price,
      this.createdAt,
      this.modifiedAt,
      this.onSale,
      this.salePrice,
      this.quantity,
      this.numPeople,
      this.numAvatars,
      this.numImages,
      this.ffRef})
      : super._();

  @override
  BundleRecord rebuild(void Function(BundleRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BundleRecordBuilder toBuilder() => new BundleRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BundleRecord &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        onSale == other.onSale &&
        salePrice == other.salePrice &&
        quantity == other.quantity &&
        numPeople == other.numPeople &&
        numAvatars == other.numAvatars &&
        numImages == other.numImages &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, modifiedAt.hashCode);
    _$hash = $jc(_$hash, onSale.hashCode);
    _$hash = $jc(_$hash, salePrice.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, numPeople.hashCode);
    _$hash = $jc(_$hash, numAvatars.hashCode);
    _$hash = $jc(_$hash, numImages.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BundleRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('price', price)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('onSale', onSale)
          ..add('salePrice', salePrice)
          ..add('quantity', quantity)
          ..add('numPeople', numPeople)
          ..add('numAvatars', numAvatars)
          ..add('numImages', numImages)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BundleRecordBuilder
    implements Builder<BundleRecord, BundleRecordBuilder> {
  _$BundleRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  bool? _onSale;
  bool? get onSale => _$this._onSale;
  set onSale(bool? onSale) => _$this._onSale = onSale;

  double? _salePrice;
  double? get salePrice => _$this._salePrice;
  set salePrice(double? salePrice) => _$this._salePrice = salePrice;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  int? _numPeople;
  int? get numPeople => _$this._numPeople;
  set numPeople(int? numPeople) => _$this._numPeople = numPeople;

  int? _numAvatars;
  int? get numAvatars => _$this._numAvatars;
  set numAvatars(int? numAvatars) => _$this._numAvatars = numAvatars;

  int? _numImages;
  int? get numImages => _$this._numImages;
  set numImages(int? numImages) => _$this._numImages = numImages;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BundleRecordBuilder() {
    BundleRecord._initializeBuilder(this);
  }

  BundleRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _price = $v.price;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _onSale = $v.onSale;
      _salePrice = $v.salePrice;
      _quantity = $v.quantity;
      _numPeople = $v.numPeople;
      _numAvatars = $v.numAvatars;
      _numImages = $v.numImages;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BundleRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BundleRecord;
  }

  @override
  void update(void Function(BundleRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BundleRecord build() => _build();

  _$BundleRecord _build() {
    final _$result = _$v ??
        new _$BundleRecord._(
            name: name,
            description: description,
            price: price,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
            onSale: onSale,
            salePrice: salePrice,
            quantity: quantity,
            numPeople: numPeople,
            numAvatars: numAvatars,
            numImages: numImages,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
