import 'package:pataya_ending_card/app/routes/app_router.dart';
import 'package:pataya_ending_card/app/services/_core/local_storage_service.dart';

import 'package:pataya_ending_card/app/views/home/home_viewmodel.dart';
import 'package:pataya_ending_card/app/views/settings/settings_view_model.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'services/_core/ecard_service.dart';
import 'ui/dialogs/slot_dialog_viewmodel.dart';
import 'views/card/card_viewmodel.dart';

@StackedApp(
  logger: StackedLogger(),
  routes: [],
  dependencies: [
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    Presolve(
      classType: ECardService,
      presolveUsing: ECardService.getInstance,
    ),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    Singleton(classType: AppRouter),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: HomeViewModel),
    Singleton(classType: SettingsViewModel),
    Singleton(classType: CardViewModel),
    Singleton(classType: SlotDialogViewModel),
  ],
)
class App {}
