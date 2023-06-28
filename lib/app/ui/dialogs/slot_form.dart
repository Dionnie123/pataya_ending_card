import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/views/card/card_viewmodel.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class SlotForm extends StatelessWidget {
  const SlotForm({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardViewModel>(context, listen: true);

    Widget bettorName() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: viewModel.formModel.teamOneNameControl,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: "Team 1",
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      );
    }

    return Column(
      children: [bettorName()],
    );
  }
}
