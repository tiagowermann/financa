import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_screen_widget.dart' show SearchScreenWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreenModel extends FlutterFlowModel<SearchScreenWidget> {
  ///  Local state fields for this page.

  List<String> selectedCategories = [];
  void addToSelectedCategories(String item) => selectedCategories.add(item);
  void removeFromSelectedCategories(String item) =>
      selectedCategories.remove(item);
  void removeAtIndexFromSelectedCategories(int index) =>
      selectedCategories.removeAt(index);
  void insertAtIndexInSelectedCategories(int index, String item) =>
      selectedCategories.insert(index, item);
  void updateSelectedCategoriesAtIndex(int index, Function(String) updateFn) =>
      selectedCategories[index] = updateFn(selectedCategories[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
