import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/ui/dialogs/confirmation_dialog.dart';
import 'package:pataya_ending_card/app/ui/dialogs/error_dialog.dart';
import 'package:pataya_ending_card/app/ui/dialogs/simple_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

import 'ui/dialogs/slot_dialog.dart';

enum DialogType { simple, confirmation, error, slot }

Future<void> setupDialogUI() async {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.simple: (context, sheetRequest, completer) =>
        SimpleDialog(request: sheetRequest, completer: completer),
    DialogType.confirmation: (context, sheetRequest, completer) =>
        ConfirmationDialog(request: sheetRequest, completer: completer),
    DialogType.error: (context, sheetRequest, completer) =>
        ErrorDialog(request: sheetRequest, completer: completer),
    DialogType.slot: (context, sheetRequest, completer) =>
        SlotDialog(request: sheetRequest, completer: completer),
  };
  dialogService.registerCustomDialogBuilders(builders);
}
