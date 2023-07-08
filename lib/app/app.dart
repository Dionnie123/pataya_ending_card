import 'package:pataya_ending_card/app/services/_core/ecard_service.dart';
import 'package:pataya_ending_card/app/views/card/card_view.dart';
import 'package:pataya_ending_card/app/views/home/home_view.dart';
import 'package:pataya_ending_card/app/views/home/home_viewmodel.dart';
import 'package:pataya_ending_card/app/views/settings/settings_view_model.dart';
import 'package:pataya_ending_card/app/views/slots/card_slots_view.dart';
import 'package:pataya_ending_card/app/views/slots/card_slots_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'views/card/card_viewmodel.dart';

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(
      page: HomeView,
      path: '/',
      initial: true,
    ),
    MaterialRoute(path: '/', page: CardView),
    MaterialRoute(path: '/', page: CardSlotsView),
  ],
  dependencies: [
    /*   Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),

    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),*/
    InitializableSingleton(
      classType: ECardService,
    ),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    Singleton(classType: HomeViewModel),
    Singleton(classType: SettingsViewModel),
    Singleton(classType: CardViewModel),
    Singleton(classType: CardSlotsViewModel),
  ],
)
class App {}
