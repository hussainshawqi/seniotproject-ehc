import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'health_centers_db_record.g.dart';

abstract class HealthCentersDbRecord
    implements Built<HealthCentersDbRecord, HealthCentersDbRecordBuilder> {
  static Serializer<HealthCentersDbRecord> get serializer =>
      _$healthCentersDbRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'healthcenter_names')
  BuiltList<DocumentReference> get healthcenterNames;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HealthCentersDbRecordBuilder builder) =>
      builder..healthcenterNames = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('healthCenters_db');

  static Stream<HealthCentersDbRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HealthCentersDbRecord._();
  factory HealthCentersDbRecord(
          [void Function(HealthCentersDbRecordBuilder) updates]) =
      _$HealthCentersDbRecord;

  static HealthCentersDbRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHealthCentersDbRecordData() =>
    serializers.toFirestore(HealthCentersDbRecord.serializer,
        HealthCentersDbRecord((h) => h..healthcenterNames = null));
