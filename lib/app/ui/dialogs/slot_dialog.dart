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
          viewModel.initForm(request.data);
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
                  Widget bettorName() {
                    return ReactiveTextField(
                      autofocus: true,
                      formControl: viewModel.formModel.nameControl,
                      showErrors: (control) => false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    );
                  }

                  Widget isPaid() {
                    return ReactiveSwitchListTile(
                      activeColor: kPrimaryColor,
                      enableFeedback: true,
                      dense: true,
                      title: const Text("Payment Done?"),
                      formControl: viewModel.formModel.isPaidControl,
                    );
                  }

                  Widget submit() {
                    return EzButton.elevated(
                      title: "ADD",
                      onTap: () {
                        completer.call(
                          DialogResponse(
                            data: Slot(
                              id: viewModel.formModel.model.id,
                              name: viewModel.formModel.model.name,
                              isPaid: viewModel.formModel.model.isPaid,
                              createdAt: DateTime.now(),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
                      child: Container(
                        width: 500,
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
                                    child: Hero(
                                      tag: "${viewModel.formModel.model.id}",
                                      child: Text(
                                        "${viewModel.formModel.model.id}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  vSpaceSmall,
                                  bettorName(),
                                  vSpaceSmall,
                                  isPaid(),
                                  vSpaceSmall,
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