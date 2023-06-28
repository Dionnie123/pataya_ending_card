import 'dart:async';
import 'package:pataya_ending_card/app/app.dialog_ui.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';

import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/routes/app_router.dart';
import 'package:pataya_ending_card/app/routes/app_router.gr.dart';
import 'package:pataya_ending_card/app/services/_core/ecard_service.dart';
import 'package:pataya_ending_card/app/views/card/card_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _eCardService = locator<ECardService>();
  final _navigationService = locator<AppRouter>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _eCardService,
      ];

  List<ECard> get cards => _eCardService.cards;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString(),
      );
    });
  }

  Future<DialogResponse<dynamic>?> confirmExit() async {
    return await _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Yes",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
  }

  update(ECard card) {
    locator<AppRouter>().push(
      CardRoute(card: card, action: ActionType.update),
    );
  }

  getAll() async {
    await runBusyFuture(_eCardService.getAll());
  }

  deleteCard(String id) async {
    await runBusyFuture(_eCardService.delete(id));
  }
}
