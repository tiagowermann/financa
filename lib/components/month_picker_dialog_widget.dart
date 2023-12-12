import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_picker_dialog_model.dart';
export 'month_picker_dialog_model.dart';

class MonthPickerDialogWidget extends StatefulWidget {
  const MonthPickerDialogWidget({
    Key? key,
    required this.currentMonth,
  }) : super(key: key);

  final int? currentMonth;

  @override
  _MonthPickerDialogWidgetState createState() =>
      _MonthPickerDialogWidgetState();
}

class _MonthPickerDialogWidgetState extends State<MonthPickerDialogWidget> {
  late MonthPickerDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthPickerDialogModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'kitcrcil' /* PICK A MONTH */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Builder(
                    builder: (context) {
                      final month = functions
                              .allMonths(
                                  FFLocalizations.of(context).languageCode)
                              ?.toList() ??
                          [];
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 2.5,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: month.length,
                        itemBuilder: (context, monthIndex) {
                          final monthItem = month[monthIndex];
                          return FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context, monthIndex + 1);
                            },
                            text: monthItem,
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: widget.currentMonth == (monthIndex + 1)
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0x004B39EF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        widget.currentMonth == (monthIndex + 1)
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: widget.currentMonth == (monthIndex + 1)
                                    ? FlutterFlowTheme.of(context).primary
                                    : Color(0xFFE0E0E0),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Text(
                  FFLocalizations.of(context).getText(
                    'oaiocrqj' /* ALL TIME */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
