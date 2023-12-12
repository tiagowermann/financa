import '/components/month_picker_dialog_widget.dart';
import '/components/user_name_icon_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'initial_widget.dart' show InitialWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class InitialModel extends FlutterFlowModel<InitialWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for user_name_icon component.
  late UserNameIconModel userNameIconModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  int? monthPicker;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userNameIconModel = createModel(context, () => UserNameIconModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userNameIconModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
