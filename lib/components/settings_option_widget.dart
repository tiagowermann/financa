import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_option_model.dart';
export 'settings_option_model.dart';

class SettingsOptionWidget extends StatefulWidget {
  const SettingsOptionWidget({
    Key? key,
    this.label,
    this.icon,
  }) : super(key: key);

  final String? label;
  final Widget? icon;

  @override
  _SettingsOptionWidgetState createState() => _SettingsOptionWidgetState();
}

class _SettingsOptionWidgetState extends State<SettingsOptionWidget> {
  late SettingsOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsOptionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
          child: widget.icon!,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 0.0, 12.0),
            child: Text(
              widget.label!,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFBDBDBD),
            size: 24.0,
          ),
        ),
      ],
    );
  }
}
