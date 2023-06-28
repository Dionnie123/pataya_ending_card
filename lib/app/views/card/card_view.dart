import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/views/card/card_slots_view.dart';
import 'package:pataya_ending_card/app/views/card/widgets/card_form.dart';
import 'package:stacked/stacked.dart';
import 'card_viewmodel.dart';

@RoutePage()
class CardView extends StatelessWidget {
  final ECard? card;
  final ActionType? action;
  const CardView({super.key, this.card, this.action});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardViewModel>.reactive(
        viewModelBuilder: () => locator<CardViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.initForm(card, actionType: action);
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return ReactiveECardForm(
            key: UniqueKey(),
            form: viewModel.formModel,
            child: Row(
              children: [
                Expanded(
                  child: Scaffold(
                    //  resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      title: viewModel.action == ActionType.add
                          ? const Text("Add Card")
                          : ReactiveECardFormConsumer(
                              builder: (context, e, child) {
                              return Text(
                                  "${viewModel.formModel.model.teamOneName} Vs.${viewModel.formModel.model.teamTwoName}");
                            }),
                      actions: [
                        IconButton(
                            onPressed: () {
                              viewModel.navigationService
                                  .pushWidget(CardSlotsView(
                                viewModel: viewModel,
                              ));
                            },
                            icon: const Icon(Icons.table_chart_rounded)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share_rounded)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.settings)),
                        IconButton(
                            onPressed: () async {
                              if (viewModel.action == ActionType.add) {
                                await viewModel.addCard();
                              }
                              if (viewModel.action == ActionType.update) {
                                await viewModel.updateCard();
                              }
                            },
                            icon: const Icon(Icons.save_rounded))
                      ],
                    ),
                    /*            bottomNavigationBar: widget.action == ActionType.add
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: EzButton.elevated(
                            title: "SAVE",
                            onTap: () async {
                              await viewModel.addCard();
                            },
                          ),
                        )
                      : null, */
                    body: const SingleChildScrollView(
                      padding: EdgeInsets.all(15),
                      child: CardForm(),
                    ),
                  ),
                ),
                Expanded(
                  child: CardSlotsView(
                    viewModel: viewModel,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
