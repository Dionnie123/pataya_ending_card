import 'package:pataya_ending_card/app/constants/action.dart';
import 'package:pataya_ending_card/app/constants/colors.dart';
import 'package:pataya_ending_card/app/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/models/slot.dart';
import 'package:pataya_ending_card/app/ui/_core/spacer.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';
import '../_core/ez_button.dart';
import 'slot_dialog_viewmodel.dart';

class SlotDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SlotDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SlotDialogViewModel>.reactive(
        viewModelBuilder: () => locator<SlotDialogViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.initForm(request.data['slot'],
              actionType: request.data['action']);
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: ReactiveFormBuilder(
                form: () => viewModel.formModel.form,
                builder: (context, form, child) {
                  Widget slotId() {
                    return Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "${viewModel.formModel.model.id}",
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
                      autofocus:
                          viewModel.action == ActionType.add ? true : false,
                      formControl: viewModel.formModel.nameControl,
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
                      activeColor: kPrimaryColor,
                      enableFeedback: true,
                      dense: true,
                      title: const Text(
                        "PAID",
                        style: TextStyle(fontSize: 16),
                      ),
                      formControl: viewModel.formModel.isPaidControl,
                    );
                  }

                  Widget submit() {
                    return ReactiveFormConsumer(
                      builder: (context, formGroup, child) {
                        return Column(
                          children: [
                            viewModel.action == ActionType.add
                                ? EzButton.elevated(
                                    disabled:
                                        viewModel.formModel.model.name == null,
                                    title: "BET",
                                    onTap: () {
                                      completer.call(
                                        DialogResponse(
                                          data: Slot(
                                            id: viewModel.formModel.model.id,
                                            name:
                                                viewModel.formModel.model.name,
                                            isPaid: viewModel
                                                .formModel.model.isPaid,
                                            createdAt: DateTime.now(),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : EzButton.elevated(
                                    disabled:
                                        (viewModel.formModel.form.pristine ==
                                                true ||
                                            "${viewModel.formModel.model.name}"
                                                .isEmpty),
                                    title: "UPDATE",
                                    onTap: () {
                                      completer.call(
                                        DialogResponse(
                                          data: Slot(
                                            id: viewModel.formModel.model.id,
                                            name:
                                                viewModel.formModel.model.name,
                                            isPaid: viewModel
                                                .formModel.model.isPaid,
                                            createdAt: DateTime.now(),
                                          ),
                                        ),
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
                            minHeight: 0,
                            maxHeight: screenHeight(context) * 0.7),
                        child: ReactiveFormBuilder(
                            form: () => form,
                            builder: (context, form, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "SLOT ${viewModel.formModel.model.id}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  vSpaceRegular,
                                  Row(
                                    children: [
                                      Expanded(child: isPaid()),
                                      hSpaceRegular,
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.delete_forever_rounded))
                                    ],
                                  ),
                                  vSpaceRegular,
                                  bettorName(),
                                  vSpaceRegular,
                                  submit(),
                                ],
                              );
                            }),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
