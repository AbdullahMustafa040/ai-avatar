import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_record.g.dart';

abstract class OrderRecord implements Built<OrderRecord, OrderRecordBuilder> {
  static Serializer<OrderRecord> get serializer => _$orderRecordSerializer;

  @BuiltValueField(wireName: 'order_id')
  String? get orderId;

  String? get type;

  @BuiltValueField(wireName: 'no_of_avatar')
  int? get noOfAvatar;

  String? get status;

  int? get price;

  @BuiltValueField(wireName: 'discounted_price')
  int? get discountedPrice;

  @BuiltValueField(wireName: 'discount_amount')
  int? get discountAmount;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(OrderRecordBuilder builder) => builder
    ..orderId = ''
    ..type = ''
    ..noOfAvatar = 0
    ..status = ''
    ..price = 0
    ..discountedPrice = 0
    ..discountAmount = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('order')
          : FirebaseFirestore.instance.collectionGroup('order');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('order').doc();

  static Stream<OrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderRecord._();
  factory OrderRecord([void Function(OrderRecordBuilder) updates]) =
      _$OrderRecord;

  static OrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderRecordData({
  String? orderId,
  String? type,
  int? noOfAvatar,
  String? status,
  int? price,
  int? discountedPrice,
  int? discountAmount,
}) {
  final firestoreData = serializers.toFirestore(
    OrderRecord.serializer,
    OrderRecord(
      (o) => o
        ..orderId = orderId
        ..type = type
        ..noOfAvatar = noOfAvatar
        ..status = status
        ..price = price
        ..discountedPrice = discountedPrice
        ..discountAmount = discountAmount,
    ),
  );

  return firestoreData;
}
