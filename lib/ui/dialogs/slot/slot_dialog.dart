import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/models/slot.dart';
import 'package:pataya_ending_card/ui/common/app_colors.dart';
import 'package:pataya_ending_card/ui/common/ui_helpers.dart';
import 'package:pataya_ending_card/ui/widgets/special/ez_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked_services/stacked_services.dart';

class SlotDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SlotDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = request.data["action"] as ActionType;

    return SlotFormBuilder(
        model: request.data["slot"] as Slot,
        builder: (context, form, child) {
          Widget slotId() {
            return Container(
              decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "${form.model.id}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            );
          }

          Widget bettorName() {
            return ReactiveTextField(
              autofocus: action == ActionType.add ? true : false,
              formControl: form.nameControl,
              showErrors: (control) => false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Bettor Name",
              ),
            );
          }

          Widget isPaid() {
            return ReactiveSwitchListTile(
              contentPadding: const EdgeInsets.only(left: 10),
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              activeColor: kcPrimaryColor,
              enableFeedback: true,
              dense: true,
              title: const Text(
                "PAID",
                style: TextStyle(fontSize: 16),
              ),
              formControl: form.isPaidControl,
            );
          }

          Widget submit() {
            return ReactiveSlotFormConsumer(
              builder: (context, formGroup, child) {
                return Column(
                  children: [
                    action == ActionType.add
                        ? EzButton.elevated(
                            disabled: form.model.name == null,
                            title: "BET",
                            onTap: () {
                              completer.call(DialogResponse(
                                  data: form.model
                                      .copyWith(createdAt: DateTime.now())));
                            },
                          )
                        : EzButton.elevated(
                            disabled: (form.form.pristine == true ||
                                "${form.model.name}".isEmpty),
                            title: "UPDATE",
                            onTap: () {
                              completer.call(DialogResponse(
                                  data: form.model
                                      .copyWith(updatedAt: DateTime.now())));
                            },
                          ),
                    vSpaceSmall,
                  ],
                );
              },
            );
          }

          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "SLOT ${form.model.id}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        vSpaceRegular,
                        Row(
                          children: [
                            Expanded(child: isPaid()),
                            hSpaceRegular,
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete_forever_rounded))
                          ],
                        ),
                        vSpaceRegular,
                        bettorName(),
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
