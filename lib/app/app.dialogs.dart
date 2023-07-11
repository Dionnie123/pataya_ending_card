// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/basic/basic_dialog.dart';
import '../ui/dialogs/confirm/confirm_dialog.dart';
import '../ui/dialogs/error/error_dialog.dart';
import '../ui/dialogs/result/result_dialog.dart';
import '../ui/dialogs/score/score_dialog.dart';
import '../ui/dialogs/slot/slot_dialog.dart';

enum DialogType {
  slot,
  score,
  confirm,
  error,
  basic,
  result,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.slot: (context, request, completer) =>
        SlotDialog(request: request, completer: completer),
    DialogType.score: (context, request, completer) =>
        ScoreDialog(request: request, completer: completer),
    DialogType.confirm: (context, request, completer) =>
        ConfirmDialog(request: request, completer: completer),
    DialogType.error: (context, request, completer) =>
        ErrorDialog(request: request, completer: completer),
    DialogType.basic: (context, request, completer) =>
        BasicDialog(request: request, completer: completer),
    DialogType.result: (context, request, completer) =>
        ResultDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
