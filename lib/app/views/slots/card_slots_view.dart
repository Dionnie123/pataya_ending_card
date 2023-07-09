import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/constants/dimensions.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/ui/_core/sliver_grid_delegate.dart';
import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import 'package:pataya_ending_card/app/views/card/widgets/slot.dart';
import 'package:pataya_ending_card/app/views/home/widgets/item.dart';
import 'package:pataya_ending_card/app/views/slots/card_slots_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CardSlotsView extends StatelessWidget {
  final ECard card;
  final ActionType action;
  const CardSlotsView({
    super.key,
    required this.card,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardSlotsViewModel>.reactive(
        viewModelBuilder: () => locator<CardSlotsViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.model = card;
          viewModel.action = action;
          viewModel.readyForm();
        },
        onDispose: (viewModel) {
          viewModel.formModel.form.dispose();
          viewModel.selectedSlotId = null;
        },
        createNewViewModelOnInsert: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return ReactiveECardForm(
            form: viewModel.formModel,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
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
                      icon: const Icon(Icons.settings_sharp)),
                ],
              ),
              body: LayoutBuilder(builder: (context, size) {
                return SingleChildScrollView(
                  padding: Dimens.computedWidth(
                      screenSize: size,
                      targetWidth: 500,
                      hPadding: 0,
                      vPadding: 0),
                  child: Column(
                    children: [
                      Card(margin: EdgeInsets.zero, child: ECardItem(card)),
                      vSpaceRegular,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                crossAxisCount: 4,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                height: 50),
                        itemCount: viewModel.slots.length,
                        itemBuilder: (context, index) {
                          final item = viewModel.slots[index];
                          return SlotCell(item,
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
                );
              }),
            ),
          );
        });
  }
}
