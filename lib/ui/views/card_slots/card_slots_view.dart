import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/extensions/string_extension.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/ui/common/dimensions.dart';
import 'package:pataya_ending_card/ui/common/ui_helpers.dart';
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
          return GestureDetector(
            onVerticalDragDown: (details) {
              viewModel.selectedSlotId = null;
            },
            onTap: () {},
            child: SingleChildScrollView(
              padding: Dimens.computedWidth(
                  screenSize: size, targetWidth: 500, hPadding: 0, vPadding: 0),
              child: Column(
                children: [
                  vSpaceSmall,
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${card.teamOneScore} ".toUpperCase(),
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "   -   ".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  "${card.teamTwoScore}".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "${card.teamOneName} ".toUpperCase(),
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      height: 1.1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "  vs  ".toUpperCase(),
                                style: const TextStyle(
                                    height: 1.1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  "${card.teamTwoName}".toUpperCase(),
                                  style: const TextStyle(
                                      height: 1.1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          if (card.title != null)
                            Text((card.title ?? "").toTitleCase()),
                          vSpaceSmall,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  Icon(Icons.circle_rounded,
                                      color: Colors.blue),
                                  Text("Paid: 1")
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  Icon(Icons.circle_rounded,
                                      color: Colors.grey),
                                  Text("Unpaid: 2")
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  Icon(Icons.circle_rounded, color: Colors.red),
                                  Text("Slots left: ")
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  Icon(Icons.circle_rounded,
                                      color: Colors.orangeAccent),
                                  Text("Winner: ")
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  vSpaceSmall,
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                              crossAxisCount: 4,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              height: 64),
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
