import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'promo_check_model.dart';
export 'promo_check_model.dart';

class PromoCheckWidget extends StatefulWidget {
  const PromoCheckWidget({Key? key}) : super(key: key);

  @override
  _PromoCheckWidgetState createState() => _PromoCheckWidgetState();
}

class _PromoCheckWidgetState extends State<PromoCheckWidget> {
  late PromoCheckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromoCheckModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<PromoRecord>>(
      stream: queryPromoRecord(
        queryBuilder: (promoRecord) =>
            promoRecord.where('title', isEqualTo: _model.title),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<PromoRecord> columnPromoRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnPromoRecord = columnPromoRecordList.isNotEmpty
            ? columnPromoRecordList.first
            : null;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  columnPromoRecord!.name!,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
