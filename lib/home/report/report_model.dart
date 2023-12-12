import '/backend/schema/structs/index.dart';
import '/components/month_picker_dialog_widget.dart';
import '/components/progress_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'report_widget.dart' show ReportWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ReportModel extends FlutterFlowModel<ReportWidget> {
  ///  Local state fields for this page.

  List<ExpenseStruct> queryExpenses = [];
  void addToQueryExpenses(ExpenseStruct item) => queryExpenses.add(item);
  void removeFromQueryExpenses(ExpenseStruct item) =>
      queryExpenses.remove(item);
  void removeAtIndexFromQueryExpenses(int index) =>
      queryExpenses.removeAt(index);
  void insertAtIndexInQueryExpenses(int index, ExpenseStruct item) =>
      queryExpenses.insert(index, item);
  void updateQueryExpensesAtIndex(
          int index, Function(ExpenseStruct) updateFn) =>
      queryExpenses[index] = updateFn(queryExpenses[index]);

  List<String> queryCategory = [];
  void addToQueryCategory(String item) => queryCategory.add(item);
  void removeFromQueryCategory(String item) => queryCategory.remove(item);
  void removeAtIndexFromQueryCategory(int index) =>
      queryCategory.removeAt(index);
  void insertAtIndexInQueryCategory(int index, String item) =>
      queryCategory.insert(index, item);
  void updateQueryCategoryAtIndex(int index, Function(String) updateFn) =>
      queryCategory[index] = updateFn(queryCategory[index]);

  bool hasCategory = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  int? monthPicker;
  // Model for progress_bar component.
  late ProgressBarModel progressBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    progressBarModel = createModel(context, () => ProgressBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    progressBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
