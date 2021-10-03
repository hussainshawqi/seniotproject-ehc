import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pharmacy_record.g.dart';

abstract class PharmacyRecord
    implements Built<PharmacyRecord, PharmacyRecordBuilder> {
  static Serializer<PharmacyRecord> get serializer =>
      _$pharmacyRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'medicine_name')
  String get medicineName;

  @nullable
  @BuiltValueField(wireName: 'medicine_bio')
  String get medicineBio;

  @nullable
  @BuiltValueField(wireName: 'medicine_image')
  String get medicineImage;

  @nullable
  @BuiltValueField(wireName: 'medicine_id')
  int get medicineId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PharmacyRecordBuilder builder) => builder
    ..medicineName = ''
    ..medicineBio = ''
    ..medicineImage = ''
    ..medicineId = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pharmacy');

  static Stream<PharmacyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PharmacyRecord._();
  factory PharmacyRecord([void Function(PharmacyRecordBuilder) updates]) =
      _$PharmacyRecord;

  static PharmacyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPharmacyRecordData({
  String medicineName,
  String medicineBio,
  String medicineImage,
  int medicineId,
}) =>
    serializers.toFirestore(
        PharmacyRecord.serializer,
        PharmacyRecord((p) => p
          ..medicineName = medicineName
          ..medicineBio = medicineBio
          ..medicineImage = medicineImage
          ..medicineId = medicineId));
