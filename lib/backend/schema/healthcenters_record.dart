import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'healthcenters_record.g.dart';

abstract class HealthcentersRecord
    implements Built<HealthcentersRecord, HealthcentersRecordBuilder> {
  static Serializer<HealthcentersRecord> get serializer =>
      _$healthcentersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'healthcenter_names')
  BuiltList<String> get healthcenterNames;

  @nullable
  BuiltList<DocumentReference> get doctors;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HealthcentersRecordBuilder builder) => builder
    ..healthcenterNames = ListBuilder()
    ..doctors = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('healthcenters');

  static Stream<HealthcentersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HealthcentersRecord._();
  factory HealthcentersRecord(
          [void Function(HealthcentersRecordBuilder) updates]) =
      _$HealthcentersRecord;

  static HealthcentersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHealthcentersRecordData() => serializers.toFirestore(
    HealthcentersRecord.serializer,
    HealthcentersRecord((h) => h
      ..healthcenterNames = null
      ..doctors = null));
