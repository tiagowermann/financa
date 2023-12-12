import '/backend/schema/structs/index.dart';
import '/components/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_expense_model.dart';
export 'edit_expense_model.dart';

class EditExpenseWidget extends StatefulWidget {
  const EditExpenseWidget({
    Key? key,
    required this.expenseId,
  }) : super(key: key);

  final int? expenseId;

  @override
  _EditExpenseWidgetState createState() => _EditExpenseWidgetState();
}

class _EditExpenseWidgetState extends State<EditExpenseWidget> {
  late EditExpenseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditExpenseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.expense = FFAppState().allExpenses[widget.expenseId!];
      });
      setState(() {
        _model.categoryDropdownValueController?.value =
            _model.expense!.category;
      });
      setState(() {
        _model.typeDropdownValueController?.value = _model.expense!.type;
      });
      setState(() {
        _model.tfAmountController?.text = _model.expense!.amount.toString();
      });
      setState(() {
        _model.tfDescriptionController?.text = _model.expense!.description;
      });
      setState(() {
        _model.selectedDate = _model.expense?.date;
      });
    });

    _model.tfAmountController ??= TextEditingController();
    _model.tfAmountFocusNode ??= FocusNode();

    _model.tfDescriptionController ??= TextEditingController();
    _model.tfDescriptionFocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).accent4,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              '0rsd07xx' /* Edit */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.typeDropdownValueController ??=
                              FormFieldController<String>(
                            _model.typeDropdownValue ??= 'INVOICE',
                          ),
                          options: List<String>.from(['EXPENSE', 'INVOICE']),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'fw9vxr1w' /* Expense */,
                            ),
                            FFLocalizations.of(context).getText(
                              'c8ij0gvp' /* Invoice */,
                            )
                          ],
                          onChanged: (val) =>
                              setState(() => _model.typeDropdownValue = val),
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'hko6ezg3' /* Income/Budget */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 1.0),
                          child: FlutterFlowDropDown<String>(
                            controller:
                                _model.categoryDropdownValueController ??=
                                    FormFieldController<String>(
                              _model.categoryDropdownValue ??= '',
                            ),
                            options: List<String>.from([
                              'CAFE',
                              'DONATE',
                              'EDUCATION',
                              'ELECTRONICS',
                              'FUEL',
                              'GIFTS',
                              'GROCERIES',
                              'HEALTH',
                              'INSTITUTE',
                              'LAUNDRY',
                              'LIQUOR',
                              'MAINTENANCE',
                              'PARTY',
                              'RESTAURANT',
                              'SAVINGS',
                              'SELF DEVELOPMENT',
                              'SPORT',
                              'TRANSPORTATION'
                            ]),
                            optionLabels: [
                              FFLocalizations.of(context).getText(
                                'nr8h2ng1' /* Cafe */,
                              ),
                              FFLocalizations.of(context).getText(
                                'z05440ij' /* Donate */,
                              ),
                              FFLocalizations.of(context).getText(
                                '5uh6sul0' /* Education */,
                              ),
                              FFLocalizations.of(context).getText(
                                'w5hqz7yh' /* Electronics */,
                              ),
                              FFLocalizations.of(context).getText(
                                '8gw9w48m' /* Fuel */,
                              ),
                              FFLocalizations.of(context).getText(
                                'x9y9xu7k' /* Gifts */,
                              ),
                              FFLocalizations.of(context).getText(
                                'liw1djky' /* Groceries */,
                              ),
                              FFLocalizations.of(context).getText(
                                'nz1ihdqw' /* Health */,
                              ),
                              FFLocalizations.of(context).getText(
                                '80ibmr1j' /* Institute */,
                              ),
                              FFLocalizations.of(context).getText(
                                'yva1sh8h' /* Laundry */,
                              ),
                              FFLocalizations.of(context).getText(
                                'nu1fvykc' /* Liquor */,
                              ),
                              FFLocalizations.of(context).getText(
                                'bv3dr91r' /* Maintenance */,
                              ),
                              FFLocalizations.of(context).getText(
                                'etzdfyfa' /* Party */,
                              ),
                              FFLocalizations.of(context).getText(
                                '6fyj8k7i' /* Resturant */,
                              ),
                              FFLocalizations.of(context).getText(
                                '23e13o2q' /* Savings */,
                              ),
                              FFLocalizations.of(context).getText(
                                'ydnrvygz' /* Self Development */,
                              ),
                              FFLocalizations.of(context).getText(
                                '057cd24w' /* Sport */,
                              ),
                              FFLocalizations.of(context).getText(
                                'dbec15tp' /* Transportation */,
                              )
                            ],
                            onChanged: (val) => setState(
                                () => _model.categoryDropdownValue = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: FFLocalizations.of(context).getText(
                              'q8mye2zp' /* Select Category */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.tfAmountController,
                            focusNode: _model.tfAmountFocusNode,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'ifjlvbhd' /* Enter amount */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              errorStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).error,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: _model.tfAmountControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[-]?[0-9.]*\$'))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: TextFormField(
                            controller: _model.tfDescriptionController,
                            focusNode: _model.tfDescriptionFocusNode,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'vg84m6jc' /* Description (Optional) */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.tfDescriptionControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2050),
                            );

                            if (_datePickedDate != null) {
                              safeSetState(() {
                                _model.datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                );
                              });
                            }
                            setState(() {
                              _model.selectedDate = _model.datePicked;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.date_range,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 12.0, 0.0, 12.0),
                                child: Text(
                                  _model.selectedDate == null
                                      ? 'Selecione uma data'
                                      : dateTimeFormat(
                                          'dd/MM/yyyy',
                                          _model.selectedDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              if (_model.typeDropdownValue == null ||
                                  _model.typeDropdownValue == '') {
                                return true;
                              } else if (_model.categoryDropdownValue == null ||
                                  _model.categoryDropdownValue == '') {
                                return true;
                              } else if (_model.tfAmountController.text ==
                                      null ||
                                  _model.tfAmountController.text == '') {
                                return true;
                              } else if (_model.selectedDate == null) {
                                return true;
                              } else {
                                return false;
                              }
                            }()
                                ? null
                                : () async {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.typeDropdownValue == null) {
                                      return;
                                    }
                                    if (_model.categoryDropdownValue == null) {
                                      return;
                                    }
                                    setState(() {
                                      FFAppState().updateAllExpensesAtIndex(
                                        widget.expenseId!,
                                        (e) => e
                                          ..type = _model.typeDropdownValue
                                          ..description = _model
                                              .tfDescriptionController.text
                                          ..amount = double.tryParse(
                                              _model.tfAmountController.text)
                                          ..category =
                                              _model.categoryDropdownValue
                                          ..date = _model.datePicked,
                                      );
                                    });
                                    context.safePop();
                                  },
                            text: FFLocalizations.of(context).getText(
                              'rt1ash54' /* Edit */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(86.0),
                              disabledColor: Color(0xFFD6D6D6),
                              disabledTextColor: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var _shouldSetState = false;
                                  await showAlignedDialog(
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0.0, 0.0)
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            child: CustomConfirmDialogWidget(
                                              title: FFLocalizations.of(context)
                                                  .getText(
                                                'izjvzi7f' /* Confirm delete */,
                                              ),
                                              message:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'r4m1t0a1' /* Are you sure you want to delet... */,
                                              ),
                                              cancelLabel:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '2gh6bfnu' /* Cancel */,
                                              ),
                                              confirmLabel:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6bd89nbx' /* Confirm */,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.confirmDelete = value));

                                  _shouldSetState = true;
                                  if (_model.confirmDelete == true) {
                                    setState(() {
                                      FFAppState().removeAtIndexFromAllExpenses(
                                          widget.expenseId!);
                                    });
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  context.safePop();
                                  if (_shouldSetState) setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x004B39EF),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.delete_forever_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'tbhvf5pj' /* Delete */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
