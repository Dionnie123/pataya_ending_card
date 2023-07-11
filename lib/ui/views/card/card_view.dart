import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/ui/common/dimensions.dart';
import 'package:pataya_ending_card/ui/widgets/common/card_form/card_form.dart';
import 'package:stacked/stacked.dart';

import 'card_viewmodel.dart';

class CardView extends StackedView<CardViewModel> {
  final ECard? card;
  final ActionType? action;
  const CardView({
    Key? key,
    this.card,
    this.action,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardViewModel viewModel,
    Widget? child,
  ) {
    return ReactiveECardForm(
      key: UniqueKey(),
      form: viewModel.formModel,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: viewModel.isAddMode() ? const Text("Add Card") : null,
        ),
        body: LayoutBuilder(builder: (context, size) {
          return SingleChildScrollView(
            padding: Dimens.computedWidth(
                screenSize: size, targetWidth: 500, hPadding: 15, vPadding: 15),
            child: const CardForm(),
          );
        }),
      ),
    );
  }

  @override
  CardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewModel();

  @override
  Future<void> onViewModelReady(CardViewModel viewModel) async {
    viewModel.model = card ?? ECard();
    viewModel.action = action ?? ActionType.add;
    viewModel.readyForm();
    super.onViewModelReady(viewModel);
  }
}
