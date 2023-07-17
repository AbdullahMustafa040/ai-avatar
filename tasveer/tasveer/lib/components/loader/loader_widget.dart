import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loader_model.dart';
export 'loader_model.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  _LoaderWidgetState createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  late LoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/lottie_animations/9764-loader.json',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
              frameRate: FrameRate(30.0),
              animate: true,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Loading',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
