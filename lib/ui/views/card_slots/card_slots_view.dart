import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/ui/common/dimensions.dart';
import 'package:pataya_ending_card/ui/widgets/common/card_item/card_item.dart';
import 'package:pataya_ending_card/ui/widgets/common/slot_item/slot_item.dart';
import 'package:pataya_ending_card/ui/widgets/special/sliver_grid_delegate.dart';
import 'package:stacked/stacked.dart';

import 'card_slots_viewmodel.dart';

class CardSlotsView extends StackedView<CardSlotsViewModel> {
  final ECard card;
  final ActionType action;
  const CardSlotsView({
    super.key,
    required this.card,
    required this.action,
  });

  @override
  Widget builder(
    BuildContext context,
    CardSlotsViewModel viewModel,
    Widget? child,
  ) {
    return ReactiveECardForm(
      form: viewModel.formModel,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  viewModel.updateScore();
                },
                icon: const Icon(Icons.scoreboard_sharp)),
            IconButton(
                onPressed: () async {
                  await viewModel.showCardForm();
                },
                icon: const Icon(Icons.edit_document)),
          ],
        ),
        body: LayoutBuilder(builder: (context, size) {
          return SingleChildScrollView(
            padding: Dimens.computedWidth(
                screenSize: size, targetWidth: 500, hPadding: 0, vPadding: 0),
            child: Card(
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  CardItem(viewModel.formModel.model),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 4,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            height: 50),
                    itemCount: viewModel.slots.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.slots[index];
                      return SlotItem(item,
                          isSelected: viewModel.selectedSlotId == item.id,
                          onTap: (slot) {
                        viewModel.updateSlot(
                            slot,
                            (item.name?.isNotEmpty ?? false)
                                ? ActionType.update
                                : ActionType.add);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  CardSlotsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardSlotsViewModel();

  @override
  void onViewModelReady(CardSlotsViewModel viewModel) {
    viewModel.model = card;
    viewModel.action = action;
    viewModel.readyForm();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CardSlotsViewModel viewModel) {
    viewModel.formModel.form.dispose();
    viewModel.selectedSlotId = null;
    super.onDispose(viewModel);
  }
}
