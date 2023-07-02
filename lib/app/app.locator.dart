// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:stacked_themes/src/theme_service.dart';

import 'routes/app_router.dart';
import 'services/_core/ecard_service.dart';
import 'services/_core/local_storage_service.dart';
import 'ui/dialogs/score_dialog_viewmodel.dart';
import 'ui/dialogs/slot_dialog_viewmodel.dart';
import 'views/card/card_viewmodel.dart';
import 'views/home/home_viewmodel.dart';
import 'views/settings/settings_view_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton(localStorageService);

  final eCardService = await ECardService.getInstance();
  locator.registerSingleton(eCardService);

  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerSingleton(AppRouter());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton(HomeViewModel());
  locator.registerSingleton(SettingsViewModel());
  locator.registerSingleton(CardViewModel());
  locator.registerSingleton(SlotDialogViewModel());
  locator.registerSingleton(ScoreDialogViewModel());
}
