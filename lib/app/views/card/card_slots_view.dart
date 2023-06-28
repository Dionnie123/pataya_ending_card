import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/ui/_core/sliver_grid_delegate.dart';
import 'package:pataya_ending_card/app/views/card/card_viewmodel.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class CardSlotsView extends StatelessWidget {
  final CardViewModel? viewModel;
  final String? cardId;
  final ECard? card;
  const CardSlotsView({
    super.key,
    @PathParam('cardId') this.cardId,
    this.card,
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardViewModel>.reactive(
        viewModelBuilder: () => viewModel ?? locator<CardViewModel>(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.formModel.model.title.toString()),
            ),
            body: GridView.builder(
              key: const PageStorageKey<String>('listvew126969'),
              padding: const EdgeInsets.all(10),
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
          );
        });
  }
}
