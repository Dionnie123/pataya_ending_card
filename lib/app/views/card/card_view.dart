import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/constants/dimensions.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/views/card/widgets/card_form.dart';
import 'package:stacked/stacked.dart';
import 'card_viewmodel.dart';

class CardView extends StatelessWidget {
  final ECard card;
  final ActionType action;
  const CardView({super.key, required this.card, required this.action});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardViewModel>.reactive(
        viewModelBuilder: () => locator<CardViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.model = card;
          viewModel.action = action;
          viewModel.readyForm();
        },
        onDispose: (viewModel) {
          viewModel.formModel.form.dispose();
        },
        createNewViewModelOnInsert: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return ReactiveECardForm(
            key: UniqueKey(),
            form: viewModel.formModel,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: viewModel.isAddMode()
                    ? const Text("Add Card")
                    : ReactiveECardFormConsumer(builder: (context, e, child) {
                        return Text("${viewModel.formModel.model.title}");
                      }),
              ),
              body: LayoutBuilder(builder: (context, size) {
                return SingleChildScrollView(
                  padding: Dimens.computedWidth(
                      screenSize: size,
                      targetWidth: 500,
                      hPadding: 15,
                      vPadding: 15),
                  child: const CardForm(),
                );
              }),
            ),
          );
        });
  }
}
