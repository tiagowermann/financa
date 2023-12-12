import '/components/alert_dialog_delete_account_widget.dart';
import '/components/bottomsheet_change_language_widget.dart';
import '/components/custom_confirm_dialog_widget.dart';
import '/components/settings_option_widget.dart';
import '/components/user_name_icon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for user_name_icon component.
  late UserNameIconModel userNameIconModel;
  // Model for settings_option_language.
  late SettingsOptionModel settingsOptionLanguageModel;
  // Model for settings_option_reset.
  late SettingsOptionModel settingsOptionResetModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in settings_option_reset widget.
  bool? confirmReset;
  // Model for settings_option_logout.
  late SettingsOptionModel settingsOptionLogoutModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in settings_option_logout widget.
  bool? confirmLogout;
  // Model for settings_option_delete.
  late SettingsOptionModel settingsOptionDeleteModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in settings_option_delete widget.
  bool? confirmDelete;
  // Model for settings_option_donate.
  late SettingsOptionModel settingsOptionDonateModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userNameIconModel = createModel(context, () => UserNameIconModel());
    settingsOptionLanguageModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionResetModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionLogoutModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionDeleteModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionDonateModel =
        createModel(context, () => SettingsOptionModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userNameIconModel.dispose();
    settingsOptionLanguageModel.dispose();
    settingsOptionResetModel.dispose();
    settingsOptionLogoutModel.dispose();
    settingsOptionDeleteModel.dispose();
    settingsOptionDonateModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
