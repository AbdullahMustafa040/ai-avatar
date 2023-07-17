// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderRecord> _$orderRecordSerializer = new _$OrderRecordSerializer();

class _$OrderRecordSerializer implements StructuredSerializer<OrderRecord> {
  @override
  final Iterable<Type> types = const [OrderRecord, _$OrderRecord];
  @override
  final String wireName = 'OrderRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orderId;
    if (value != null) {
      result
        ..add('order_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.noOfAvatar;
    if (value != null) {
      result
        ..add('no_of_avatar')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.discountedPrice;
    if (value != null) {
      result
        ..add('discounted_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.discountAmount;
    if (value != null) {
      result
        ..add('discount_amount')
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
  OrderRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'order_id':
          result.orderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'no_of_avatar':
          result.noOfAvatar = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'discounted_price':
          result.discountedPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'discount_amount':
          result.discountAmount = serializers.deserialize(value,
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

class _$OrderRecord extends OrderRecord {
  @override
  final String? orderId;
  @override
  final String? type;
  @override
  final int? noOfAvatar;
  @override
  final String? status;
  @override
  final int? price;
  @override
  final int? discountedPrice;
  @override
  final int? discountAmount;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderRecord([void Function(OrderRecordBuilder)? updates]) =>
      (new OrderRecordBuilder()..update(updates))._build();

  _$OrderRecord._(
      {this.orderId,
      this.type,
      this.noOfAvatar,
      this.status,
      this.price,
      this.discountedPrice,
      this.discountAmount,
      this.ffRef})
      : super._();

  @override
  OrderRecord rebuild(void Function(OrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderRecordBuilder toBuilder() => new OrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderRecord &&
        orderId == other.orderId &&
        type == other.type &&
        noOfAvatar == other.noOfAvatar &&
        status == other.status &&
        price == other.price &&
        discountedPrice == other.discountedPrice &&
        discountAmount == other.discountAmount &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, noOfAvatar.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, discountedPrice.hashCode);
    _$hash = $jc(_$hash, discountAmount.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderRecord')
          ..add('orderId', orderId)
          ..add('type', type)
          ..add('noOfAvatar', noOfAvatar)
          ..add('status', status)
          ..add('price', price)
          ..add('discountedPrice', discountedPrice)
          ..add('discountAmount', discountAmount)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderRecordBuilder implements Builder<OrderRecord, OrderRecordBuilder> {
  _$OrderRecord? _$v;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _noOfAvatar;
  int? get noOfAvatar => _$this._noOfAvatar;
  set noOfAvatar(int? noOfAvatar) => _$this._noOfAvatar = noOfAvatar;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  int? _discountedPrice;
  int? get discountedPrice => _$this._discountedPrice;
  set discountedPrice(int? discountedPrice) =>
      _$this._discountedPrice = discountedPrice;

  int? _discountAmount;
  int? get discountAmount => _$this._discountAmount;
  set discountAmount(int? discountAmount) =>
      _$this._discountAmount = discountAmount;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderRecordBuilder() {
    OrderRecord._initializeBuilder(this);
  }

  OrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _type = $v.type;
      _noOfAvatar = $v.noOfAvatar;
      _status = $v.status;
      _price = $v.price;
      _discountedPrice = $v.discountedPrice;
      _discountAmount = $v.discountAmount;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderRecord;
  }

  @override
  void update(void Function(OrderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderRecord build() => _build();

  _$OrderRecord _build() {
    final _$result = _$v ??
        new _$OrderRecord._(
            orderId: orderId,
            type: type,
            noOfAvatar: noOfAvatar,
            status: status,
            price: price,
            discountedPrice: discountedPrice,
            discountAmount: discountAmount,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
