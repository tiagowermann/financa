import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_name_icon_model.dart';
export 'user_name_icon_model.dart';

class UserNameIconWidget extends StatefulWidget {
  const UserNameIconWidget({
    Key? key,
    double? size,
    double? fontSize,
  })  : this.size = size ?? 32.0,
        this.fontSize = fontSize ?? 14.0,
        super(key: key);

  final double size;
  final double fontSize;

  @override
  _UserNameIconWidgetState createState() => _UserNameIconWidgetState();
}

class _UserNameIconWidgetState extends State<UserNameIconWidget> {
  late UserNameIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserNameIconModel());

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

    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Text(
          FFLocalizations.of(context).getText(
            '6qw7pk5q' /* J */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: widget.fontSize,
              ),
        ),
      ),
    );
  }
}
