import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pataya_ending_card/ui/views/home/home_view.dart';
import 'package:pataya_ending_card/ui/bottom_sheets/basic/basic_sheet.dart';

import 'package:pataya_ending_card/ui/views/card/card_view.dart';
import 'package:pataya_ending_card/ui/views/card_slots/card_slots_view.dart';
import 'package:pataya_ending_card/services/e_card_service.dart';
import 'package:pataya_ending_card/ui/dialogs/slot/slot_dialog.dart';
import 'package:pataya_ending_card/ui/dialogs/score/score_dialog.dart';
import 'package:pataya_ending_card/ui/dialogs/confirm/confirm_dialog.dart';
import 'package:pataya_ending_card/ui/dialogs/error/error_dialog.dart';
import 'package:pataya_ending_card/ui/dialogs/basic/basic_dialog.dart';
import 'package:pataya_ending_card/ui/dialogs/result/result_dialog.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(
      page: HomeView,
      path: '/',
      initial: true,
    ),
    MaterialRoute(
      page: CardView,
      path: '/',
    ),
    MaterialRoute(
      page: CardSlotsView,
      path: '/',
    ),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    InitializableSingleton(classType: ECardService),
// @stacked-service
  ],
  bottomsheets: [
    //StackedBottomsheet(classType: NoticeSheet),

    StackedBottomsheet(classType: BasicSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    // StackedDialog(classType: InfoAlertDialog),

    StackedDialog(classType: SlotDialog),
    StackedDialog(classType: ScoreDialog),
    StackedDialog(classType: ConfirmDialog),
    StackedDialog(classType: ErrorDialog),
    StackedDialog(classType: BasicDialog),
    StackedDialog(classType: ResultDialog),
// @stacked-dialog
  ],
)
class App {}
