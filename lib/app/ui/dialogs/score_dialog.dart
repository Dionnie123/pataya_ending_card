import 'package:pataya_ending_card/app/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../_core/ez_button.dart';

class ScoreDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ScoreDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = request.data;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ReactiveFormBuilder(
          form: () => viewModel!.formModel.form,
          builder: (context, form, child) {
            Widget teamOneScore() {
              return ReactiveTextField(
                showErrors: (control) => false,
                formControl: viewModel?.formModel.teamOneScoreControl,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  label: Text(
                      "${viewModel?.model?.teamOneName ?? "Team 1"} Score"),
                ),
              );
            }

            Widget teamTwoScore() {
              return ReactiveTextField(
                showErrors: (control) => false,
                formControl: viewModel?.formModel.teamTwoScoreControl,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  label: Text(
                      "${viewModel?.model?.teamTwoName ?? "Team 2"} Score"),
                ),
              );
            }

            Widget submit() {
              return ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  return Column(
                    children: [
                      EzButton.elevated(
                        disabled: (viewModel?.formModel.form.pristine == true),
                        title: "UPDATE",
                        onTap: () {
                          completer.call(
                            DialogResponse(data: viewModel?.formModel.model),
                          );
                        },
                      ),
                      vSpaceSmall,
                    ],
                  );
                },
              );
            }

            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
                child: Container(
                  width: 300,
                  constraints: BoxConstraints(
                      minHeight: 0, maxHeight: screenHeight(context) * 0.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          "GAME SCORE",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      vSpaceRegular,
                      teamOneScore(),
                      vSpaceRegular,
                      teamTwoScore(),
                      vSpaceRegular,
                      submit(),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
