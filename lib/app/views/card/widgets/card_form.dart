import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pataya_ending_card/app/ui/_core/ez_button.dart';
import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import 'package:pataya_ending_card/app/views/card/card_viewmodel.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

import '../../../models/ecard.dart';

class CardForm extends StatelessWidget {
  final void Function(bool)? onSuccessfulLogin;

  const CardForm({super.key, this.onSuccessfulLogin});
  @override
  Widget build(BuildContext context) {
    ReactiveECardForm.of(context);
    final viewModel = getParentViewModel<CardViewModel>(context, listen: true);

    Widget gameDate() {
      return ReactiveDateTimePicker(
        formControl: viewModel.formModel.dateControl,
        type: ReactiveDatePickerFieldType.dateTime,
        dateFormat: DateFormat('EEE, MMM. d, yyyy h:mma'),
        decoration: const InputDecoration(
          labelText: 'Date & Time',
          suffixIcon: Icon(Icons.watch_later_outlined),
        ),
      );
    }

    Widget gameTitle() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: viewModel.formModel.titleControl,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          label: Text("Game Title"),
        ),
      );
    }

    Widget teamOneName() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: viewModel.formModel.teamOneNameControl,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          label: Text("Team 1"),
        ),
      );
    }

    Widget teamTwoName() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: viewModel.formModel.teamTwoNameControl,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          label: Text("Team 2"),
        ),
      );
    }

    Widget teamOneScore() {
      return ReactiveTextField(
        onChanged: (control) {
          viewModel.mapSlot();
        },
        showErrors: (control) => false,
        formControl: viewModel.formModel.teamOneScoreControl,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          label: Text("Team 1 Score"),
        ),
      );
    }

    Widget teamTwoScore() {
      return ReactiveTextField(
        onChanged: (control) {
          viewModel.mapSlot();
        },
        showErrors: (control) => false,
        formControl: viewModel.formModel.teamTwoScoreControl,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          label: Text("Team 2 Score"),
        ),
      );
    }

    Widget betAmount() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: viewModel.formModel.betAmountControl,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: "Bet Amount",
        ),
      );
    }

    Widget winAmount() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: viewModel.formModel.prizeControl,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: "Win Amount",
        ),
      );
    }

    Widget remarks() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: viewModel.formModel.remarksControl,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.done,
        minLines: 3,
        maxLines: 5,
        decoration: const InputDecoration(
            label: Text("Remarks"),
            floatingLabelBehavior: FloatingLabelBehavior.always),
      );
    }

    return Column(
      children: [
        gameDate(),
        vSpaceRegular,
        gameTitle(),
        vSpaceRegular,
        Row(
          children: [
            Expanded(child: teamOneName()),
            hSpaceRegular,
            Expanded(child: teamOneScore())
          ],
        ),
        vSpaceRegular,
        Row(
          children: [
            Expanded(child: teamTwoName()),
            hSpaceRegular,
            Expanded(child: teamTwoScore())
          ],
        ),
        vSpaceRegular,
        betAmount(),
        vSpaceRegular,
        winAmount(),
        vSpaceRegular,
        remarks(),
        vSpaceRegular,
        EzButton.elevated(
          title: "Delete",
          onTap: () {},
          background: Colors.red,
        )
      ],
    );
  }
}
