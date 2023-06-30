import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/ui/_core/sliver_grid_delegate.dart';
import 'package:pataya_ending_card/app/views/card/card_viewmodel.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class CardSlotsView extends StatelessWidget {
  final ECard card;
  final ActionType? action;

  const CardSlotsView({super.key, required this.card, this.action});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardViewModel>.reactive(
        viewModelBuilder: () => locator<CardViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.initForm(card, actionType: action);
        },
        createNewViewModelOnInsert: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Slots"),
            ),
            body: SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.all(15),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        height: 50),
                itemCount: viewModel.slots.length,
                itemBuilder: (context, index) {
                  return viewModel.slots[index];
                },
              ),
            ),
          );
        });
  }
}
