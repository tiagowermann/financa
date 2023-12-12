import '/backend/schema/structs/index.dart';
import '/components/month_picker_dialog_widget.dart';
import '/components/progress_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'report_model.dart';
export 'report_model.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  _ReportWidgetState createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget>
    with TickerProviderStateMixin {
  late ReportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.queryExpenses =
            FFAppState().allExpenses.toList().cast<ExpenseStruct>();
        _model.queryCategory = functions
            .filterCategoriesByTimestamps(FFAppState().allExpenses.toList(),
                FFAppState().queryTimestamps.toList())
            .toList()
            .cast<String>();
        _model.hasCategory = functions
                .filterCategoriesByTimestamps(FFAppState().allExpenses.toList(),
                    FFAppState().queryTimestamps.toList())
                .length >
            0;
      });
      setState(() {
        FFAppState().queryTimestamps = functions
            .getExpenseListForTimestamp(FFAppState().allExpenses.toList(),
                FFAppState().month, FFAppState().year)!
            .toList()
            .cast<int>();
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation']!
          .controller
          .forward(from: 0.0);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'pxio3obv' /* Statistics */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: FlutterFlowIconButton(
                                    borderColor: Color(0x004B39EF),
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Color(0x004B39EF),
                                    icon: FaIcon(
                                      FontAwesomeIcons.search,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'searchScreen',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.scale,
                                            alignment: Alignment.bottomCenter,
                                            duration:
                                                Duration(milliseconds: 600),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: FlutterFlowIconButton(
                                  borderColor: Color(0x004B39EF),
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Color(0x004B39EF),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (() {
                                          if (FFAppState().month == 0) {
                                            return true;
                                          } else if (FFAppState().year == 0) {
                                            return true;
                                          } else {
                                            return false;
                                          }
                                        }() ==
                                        true) {
                                      setState(() {
                                        FFAppState().month = functions
                                            .getMonthNumber(getCurrentTimestamp
                                                .millisecondsSinceEpoch)!;
                                        FFAppState().year =
                                            functions.getYearFromTimestamp(
                                                getCurrentTimestamp
                                                    .millisecondsSinceEpoch)!;
                                      });
                                    } else if (FFAppState().month == 1) {
                                      setState(() {
                                        FFAppState().month = 12;
                                        FFAppState().year =
                                            FFAppState().year + -1;
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().month =
                                            FFAppState().month + -1;
                                      });
                                    }

                                    setState(() {
                                      FFAppState().queryTimestamps = functions
                                          .getExpenseListForTimestamp(
                                              _model.queryExpenses.toList(),
                                              FFAppState().month,
                                              FFAppState().year)!
                                          .toList()
                                          .cast<int>();
                                    });
                                    setState(() {
                                      _model.queryCategory = functions
                                          .filterCategoriesByTimestamps(
                                              FFAppState().allExpenses.toList(),
                                              FFAppState()
                                                  .queryTimestamps
                                                  .toList())
                                          .toList()
                                          .cast<String>();
                                      _model.hasCategory = functions
                                              .filterCategoriesByTimestamps(
                                                  FFAppState()
                                                      .allExpenses
                                                      .toList(),
                                                  FFAppState()
                                                      .queryTimestamps
                                                      .toList())
                                              .length >
                                          0;
                                    });
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation'] !=
                                        null) {
                                      setState(
                                          () => hasContainerTriggered = true);
                                      SchedulerBinding.instance
                                          .addPostFrameCallback((_) async =>
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0));
                                    }
                                  },
                                ),
                              ),
                              Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    if (FFAppState().month == 0) {
                                      setState(() {
                                        FFAppState().month = functions
                                            .getMonthNumber(getCurrentTimestamp
                                                .millisecondsSinceEpoch)!;
                                      });
                                    }
                                    if (FFAppState().year == 0) {
                                      setState(() {
                                        FFAppState().year =
                                            functions.getYearFromTimestamp(
                                                getCurrentTimestamp
                                                    .millisecondsSinceEpoch)!;
                                      });
                                    }
                                    await showAlignedDialog(
                                      barrierColor: Color(0x004B39EF),
                                      context: context,
                                      isGlobal: true,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Container(
                                              height: 270.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              child: MonthPickerDialogWidget(
                                                currentMonth:
                                                    FFAppState().month,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.monthPicker = value));

                                    if (_model.monthPicker != null) {
                                      setState(() {
                                        FFAppState().month =
                                            _model.monthPicker!;
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().month = 0;
                                        FFAppState().year = 0;
                                      });
                                    }

                                    setState(() {
                                      FFAppState().queryTimestamps = functions
                                          .getExpenseListForTimestamp(
                                              _model.queryExpenses.toList(),
                                              FFAppState().month,
                                              FFAppState().year)!
                                          .toList()
                                          .cast<int>();
                                    });
                                    setState(() {
                                      _model.queryCategory = functions
                                          .filterCategoriesByTimestamps(
                                              FFAppState().allExpenses.toList(),
                                              FFAppState()
                                                  .queryTimestamps
                                                  .toList())
                                          .toList()
                                          .cast<String>();
                                      _model.hasCategory = functions
                                              .filterCategoriesByTimestamps(
                                                  FFAppState()
                                                      .allExpenses
                                                      .toList(),
                                                  FFAppState()
                                                      .queryTimestamps
                                                      .toList())
                                              .length >
                                          0;
                                    });
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation'] !=
                                        null) {
                                      setState(
                                          () => hasContainerTriggered = true);
                                      SchedulerBinding.instance
                                          .addPostFrameCallback((_) async =>
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0));
                                    }

                                    setState(() {});
                                  },
                                  text: FFAppState().month == 0
                                      ? FFLocalizations.of(context)
                                          .getVariableText(
                                          enText: 'All Time',
                                          ptText: 'Tudo',
                                        )
                                      : '${functions.getMonthName(FFAppState().month, FFLocalizations.of(context).languageCode)}, ${FFAppState().year.toString()}',
                                  icon: Icon(
                                    Icons.date_range,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFE0E0E0),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Color(0x004B39EF),
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Color(0x004B39EF),
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  if (() {
                                        if (FFAppState().month == 0) {
                                          return true;
                                        } else if (FFAppState().year == 0) {
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      }() ==
                                      true) {
                                    setState(() {
                                      FFAppState().month = functions
                                          .getMonthNumber(getCurrentTimestamp
                                              .millisecondsSinceEpoch)!;
                                      FFAppState().year =
                                          functions.getYearFromTimestamp(
                                              getCurrentTimestamp
                                                  .millisecondsSinceEpoch)!;
                                    });
                                  } else if (FFAppState().month == 12) {
                                    setState(() {
                                      FFAppState().month = 1;
                                      FFAppState().year = FFAppState().year + 1;
                                    });
                                  } else {
                                    setState(() {
                                      FFAppState().month =
                                          FFAppState().month + 1;
                                    });
                                  }

                                  setState(() {
                                    FFAppState().queryTimestamps = functions
                                        .getExpenseListForTimestamp(
                                            _model.queryExpenses.toList(),
                                            FFAppState().month,
                                            FFAppState().year)!
                                        .toList()
                                        .cast<int>();
                                  });
                                  setState(() {
                                    _model.queryCategory = functions
                                        .filterCategoriesByTimestamps(
                                            FFAppState().allExpenses.toList(),
                                            FFAppState()
                                                .queryTimestamps
                                                .toList())
                                        .toList()
                                        .cast<String>();
                                    _model.hasCategory = functions
                                            .filterCategoriesByTimestamps(
                                                FFAppState()
                                                    .allExpenses
                                                    .toList(),
                                                FFAppState()
                                                    .queryTimestamps
                                                    .toList())
                                            .length >
                                        0;
                                  });
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation'] !=
                                      null) {
                                    setState(
                                        () => hasContainerTriggered = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.hasCategory == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '27cpwyz9' /* OVERVIEW */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: wrapWithModel(
                                                model: _model.progressBarModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: ProgressBarWidget(
                                                  queryExpenses:
                                                      _model.queryExpenses,
                                                  queryCategory:
                                                      _model.queryCategory,
                                                  queryTimestamp: FFAppState()
                                                      .queryTimestamps,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ohe1klja' /* DETAILS */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final category = _model
                                                    .queryCategory
                                                    .toList();
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      category.length,
                                                      (categoryIndex) {
                                                    final categoryItem =
                                                        category[categoryIndex];
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            functions
                                                                .getAssetFromCategory(
                                                                    categoryItem)!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.getCategoryLabel(
                                                                        categoryItem,
                                                                        FFLocalizations.of(context)
                                                                            .languageCode),
                                                                    'a',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  '${functions.filterAndCountExpenseRecords(_model.queryExpenses.toList(), categoryItem, FFAppState().queryTimestamps.toList()).toString()} transactions',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              formatNumber(
                                                                functions.calculateTotalRealAmountFromCategory(
                                                                    _model
                                                                        .queryExpenses
                                                                        .toList(),
                                                                    categoryItem,
                                                                    FFAppState()
                                                                        .queryTimestamps
                                                                        .toList()),
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .commaDecimal,
                                                                currency:
                                                                    'R\$ ',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: () {
                                                                      if (functions.calculateTotalRealAmountFromCategory(
                                                                              _model.queryExpenses
                                                                                  .toList(),
                                                                              categoryItem,
                                                                              FFAppState()
                                                                                  .queryTimestamps
                                                                                  .toList())! >
                                                                          0.0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .success;
                                                                      } else if (functions.calculateTotalRealAmountFromCategory(
                                                                              _model.queryExpenses.toList(),
                                                                              categoryItem,
                                                                              FFAppState().queryTimestamps.toList())! <
                                                                          0.0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      }
                                                                    }(),
                                                                  ),
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                ((functions.calculateTotalAmountFromCategory(
                                                                        _model
                                                                            .queryExpenses
                                                                            .toList(),
                                                                        categoryItem,
                                                                        FFAppState()
                                                                            .queryTimestamps
                                                                            .toList())! /
                                                                    functions.getTotalAmountFromTimestampsCategories(
                                                                        FFAppState()
                                                                            .queryTimestamps
                                                                            .toList(),
                                                                        _model
                                                                            .queryCategory
                                                                            .toList(),
                                                                        _model
                                                                            .queryExpenses
                                                                            .toList())!)),
                                                                formatType:
                                                                    FormatType
                                                                        .percent,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 10.0)),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (_model.hasCategory == false)
                                    Expanded(
                                      child: Lottie.asset(
                                        'assets/lottie_animations/animation_lllbg02q.json',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        fit: BoxFit.contain,
                                        repeat: false,
                                        animate: true,
                                      ),
                                    ),
                                ],
                              ),
                            )
                                .animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!)
                                .animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation']!,
                                    hasBeenTriggered: hasContainerTriggered),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
