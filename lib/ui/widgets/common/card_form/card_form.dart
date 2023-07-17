import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/ui/common/app_colors.dart';
import 'package:pataya_ending_card/ui/common/ui_helpers.dart';
import 'package:pataya_ending_card/ui/views/card/card_viewmodel.dart';
import 'package:pataya_ending_card/ui/widgets/special/ez_button.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class CardForm extends StatelessWidget {
  const CardForm({super.key});
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
        ),
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
            Expanded(child: teamTwoName()),
          ],
        ),
        vSpaceRegular,
        Row(
          children: [
            Expanded(child: betAmount()),
            hSpaceRegular,
            Expanded(child: winAmount()),
          ],
        ),
        vSpaceRegular,
        remarks(),
        vSpaceRegular,
        if (viewModel.action == ActionType.add)
          EzButton.elevated(
            title: "Save",
            onTap: () async {
              await viewModel.create();
            },
            background: kcPrimaryColor,
          ),
        if (viewModel.action == ActionType.update)
          EzButton.elevated(
            disabled: viewModel.formModel.form.pristine,
            title: "Update",
            onTap: () async {
              await viewModel.update();
              viewModel.routingService.pop(viewModel.formModel.model);
            },
          ),
        vSpaceRegular,
        if (viewModel.isUpdateMode())
          EzButton.outline(
            title: "Delete",
            onTap: () async {
              await viewModel.delete();
            },
            background: Colors.red,
          )
      ],
    );
  }
}
