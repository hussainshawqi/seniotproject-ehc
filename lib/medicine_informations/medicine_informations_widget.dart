import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineInformationsWidget extends StatefulWidget {
  MedicineInformationsWidget({
    Key key,
    this.medicineName,
    this.medicineID,
    this.medicineBio,
    this.medicineImage,
  }) : super(key: key);

  final String medicineName;
  final int medicineID;
  final String medicineBio;
  final String medicineImage;

  @override
  _MedicineInformationsWidgetState createState() =>
      _MedicineInformationsWidgetState();
}

class _MedicineInformationsWidgetState
    extends State<MedicineInformationsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: StreamBuilder<List<PharmacyRecord>>(
          stream: queryPharmacyRecord(
            queryBuilder: (pharmacyRecord) => pharmacyRecord
                .where('medicine_name', isEqualTo: widget.medicineName),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.primaryColor,
                  ),
                ),
              );
            }
            List<PharmacyRecord> textPharmacyRecordList = snapshot.data;
            // Customize what your widget looks like with no query results.
            if (snapshot.data.isEmpty) {
              return Material(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text('No results.'),
                  ),
                ),
              );
            }
            final textPharmacyRecord = textPharmacyRecordList.first;
            return Text(
              widget.medicineName,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.tertiaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<PharmacyRecord>>(
                        stream: queryPharmacyRecord(
                          queryBuilder: (pharmacyRecord) =>
                              pharmacyRecord.where('medicine_image',
                                  isEqualTo: widget.medicineImage),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                            );
                          }
                          List<PharmacyRecord> imagePharmacyRecordList =
                              snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            return Material(
                              child: Container(
                                height: 100,
                                child: Center(
                                  child: Text('No results.'),
                                ),
                              ),
                            );
                          }
                          final imagePharmacyRecord =
                              imagePharmacyRecordList.first;
                          return Image.network(
                            valueOrDefault<String>(
                              widget.medicineImage,
                              'https://www.nicepng.com/png/detail/297-2974273_tablet-clipart-medicine-tablet-clip-art-of-medicine.png',
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<PharmacyRecord>>(
                          stream: queryPharmacyRecord(
                            queryBuilder: (pharmacyRecord) =>
                                pharmacyRecord.where('medicine_name',
                                    isEqualTo: widget.medicineName),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<PharmacyRecord> textPharmacyRecordList =
                                snapshot.data;
                            // Customize what your widget looks like with no query results.
                            if (snapshot.data.isEmpty) {
                              return Material(
                                child: Container(
                                  height: 100,
                                  child: Center(
                                    child: Text('No results.'),
                                  ),
                                ),
                              );
                            }
                            final textPharmacyRecord =
                                textPharmacyRecordList.first;
                            return Text(
                              widget.medicineName,
                              style: FlutterFlowTheme.subtitle1.override(
                                fontFamily: 'Playfair Display',
                                color: Color(0xFF151B1E),
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<List<PharmacyRecord>>(
                            stream: queryPharmacyRecord(
                              queryBuilder: (pharmacyRecord) =>
                                  pharmacyRecord.where('medicine_bio',
                                      isEqualTo: widget.medicineBio),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PharmacyRecord> textPharmacyRecordList =
                                  snapshot.data;
                              // Customize what your widget looks like with no query results.
                              if (snapshot.data.isEmpty) {
                                return Material(
                                  child: Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  ),
                                );
                              }
                              final textPharmacyRecord =
                                  textPharmacyRecordList.first;
                              return Text(
                                valueOrDefault<String>(
                                  widget.medicineBio,
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce luctus quam in turpis fermentum, ac bibendum orci eleifend. Mauris vel justo sodales, laoreet massa in, faucibus enim. Suspendisse quis eros ex. Suspendisse gravida odio dui, id euismod nisl vulputate a. Donec sit amet neque eros. Nam risus orci, hendrerit eget rhoncus sed, condimentum eget ex. Pellentesque eu libero id leo maximus tincidunt. Etiam viverra ante ex, non maximus nulla tincidunt quis. Pellentesque vitae purus purus. Donec in est leo.',
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.secondaryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x2D000000),
                        offset: Offset(0, -2),
                      )
                    ],
                  ),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Order medicine',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.secondaryColor,
                      textStyle: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 0,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
