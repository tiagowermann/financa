import '/backend/schema/structs/index.dart';
import '/components/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_expense_widget.dart' show EditExpenseWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditExpenseModel extends FlutterFlowModel<EditExpenseWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ExpenseStruct? expense;
  void updateExpenseStruct(Function(ExpenseStruct) updateFn) =>
      updateFn(expense ??= ExpenseStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for typeDropdown widget.
  String? typeDropdownValue;
  FormFieldController<String>? typeDropdownValueController;
  // State field(s) for categoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // State field(s) for tfAmount widget.
  FocusNode? tfAmountFocusNode;
  TextEditingController? tfAmountController;
  String? Function(BuildContext, String?)? tfAmountControllerValidator;
  String? _tfAmountControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z0ydpuso' /* Amount is required */,
      );
    }

    if (!RegExp('^[-+]?\\d+(\\.\\d{1,2})?\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '0636u1e0' /* Invalid value for Amount. Ex: ... */,
      );
    }
    return null;
  }

  // State field(s) for tfDescription widget.
  FocusNode? tfDescriptionFocusNode;
  TextEditingController? tfDescriptionController;
  String? Function(BuildContext, String?)? tfDescriptionControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? confirmDelete;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tfAmountControllerValidator = _tfAmountControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    tfAmountFocusNode?.dispose();
    tfAmountController?.dispose();

    tfDescriptionFocusNode?.dispose();
    tfDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
