import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/ui/_core/sliver_grid_delegate.dart';
import 'package:pataya_ending_card/app/views/card/card_viewmodel.dart';
import 'package:pataya_ending_card/app/views/card/widgets/slot.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class CardSlotsView extends StatelessWidget {
  final ECard? card;
  final ActionType? action;

  const CardSlotsView({super.key, required this.card, this.action});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardViewModel>.reactive(
        viewModelBuilder: () => locator<CardViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.initForm(card, actionType: action);
          viewModel.mapSlot();
        },
        onDispose: (viewModel) {
          viewModel.formModel.form.dispose();
          viewModel.selectedSlotId = null;
        },
        createNewViewModelOnInsert: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.formModel.model.title.toString()),
              actions: [
                IconButton(
                    onPressed: () async {
                      await viewModel.showCardForm();
                    },
                    icon: const Icon(Icons.settings)),
              ],
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
                  final item = viewModel.slots[index];
                  return SlotCell(item,
                      isSelected: viewModel.selectedSlotId == item.id,
                      onTap: (slot) {
                    viewModel.manageSlot(
                        slot,
                        (item.name?.isNotEmpty ?? false)
                            ? ActionType.update
                            : ActionType.add);
                  });
                },
              ),
            ),
          );
        });
  }
}
