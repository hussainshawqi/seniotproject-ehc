import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'doctors_record.g.dart';

abstract class DoctorsRecord
    implements Built<DoctorsRecord, DoctorsRecordBuilder> {
  static Serializer<DoctorsRecord> get serializer => _$doctorsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'doctor_name')
  String get doctorName;

  @nullable
  @BuiltValueField(wireName: 'doctor_id')
  String get doctorId;

  @nullable
  @BuiltValueField(wireName: 'doctor_email')
  String get doctorEmail;

  @nullable
  @BuiltValueField(wireName: 'doctor_password')
  String get doctorPassword;

  @nullable
  @BuiltValueField(wireName: 'doctor_phoneNumber')
  int get doctorPhoneNumber;

  @nullable
  @BuiltValueField(wireName: 'doctor_image')
  String get doctorImage;

  @nullable
  @BuiltValueField(wireName: 'doctor_belong')
  DocumentReference get doctorBelong;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DoctorsRecordBuilder builder) => builder
    ..doctorName = ''
    ..doctorId = ''
    ..doctorEmail = ''
    ..doctorPassword = ''
    ..doctorPhoneNumber = 0
    ..doctorImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DoctorsRecord._();
  factory DoctorsRecord([void Function(DoctorsRecordBuilder) updates]) =
      _$DoctorsRecord;

  static DoctorsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDoctorsRecordData({
  String doctorName,
  String doctorId,
  String doctorEmail,
  String doctorPassword,
  int doctorPhoneNumber,
  String doctorImage,
  DocumentReference doctorBelong,
}) =>
    serializers.toFirestore(
        DoctorsRecord.serializer,
        DoctorsRecord((d) => d
          ..doctorName = doctorName
          ..doctorId = doctorId
          ..doctorEmail = doctorEmail
          ..doctorPassword = doctorPassword
          ..doctorPhoneNumber = doctorPhoneNumber
          ..doctorImage = doctorImage
          ..doctorBelong = doctorBelong));
