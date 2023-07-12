import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/ui/common/ui_helpers.dart';
import 'package:pataya_ending_card/ui/widgets/special/ez_button.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

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
    return ECardFormBuilder(
        model: request.data["card"] as ECard,
        builder: (context, formGroup, child) {
          Widget teamOneScore() {
            return ReactiveTextField(
              showErrors: (control) => false,
              onChanged: (control) {
                formGroup.form.markAsDirty();
              },
              formControl: formGroup.teamOneScoreControl,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                label: Text("${formGroup.model.teamOneName ?? "Team 1"} Score"),
              ),
            );
          }

          Widget teamTwoScore() {
            return ReactiveTextField(
              showErrors: (control) => false,
              onChanged: (control) {
                formGroup.form.markAsDirty();
              },
              formControl: formGroup.teamTwoScoreControl,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                label: Text("${formGroup.model.teamTwoName ?? "Team 2"} Score"),
              ),
            );
          }

          Widget submit() {
            return ReactiveECardFormConsumer(
              builder: (context, formGroup, child) {
                return Column(
                  children: [
                    EzButton.elevated(
                      disabled: (formGroup.form.pristine == true),
                      title: "UPDATE",
                      onTap: () {
                        completer.call(
                          DialogResponse(data: formGroup.model),
                        );
                      },
                    ),
                    vSpaceSmall,
                  ],
                );
              },
            );
          }

          return Dialog(
              shape: dialogShape,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: ClipRRect(
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
              ));
        });
  }
}
