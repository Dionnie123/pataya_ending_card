import 'dart:async';
import 'package:pataya_ending_card/app/app.dialogs.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.router.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/services/e_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');

  final _dialogService = locator<DialogService>();
  final _eCardService = locator<ECardService>();
  final routingService = locator<RouterService>();

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
      variant: DialogType.confirm,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Yes",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
  }

  update(ECard card) {
    routingService
        .navigateTo(CardViewRoute(card: card, action: ActionType.update));
  }

  getAll() async {
    await runBusyFuture(_eCardService.getAll());
  }

  deleteCard(String id) async {
    await runBusyFuture(_eCardService.delete(id));
  }
}
