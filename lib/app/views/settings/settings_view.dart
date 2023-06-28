import 'package:flutter/material.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/ui/_core/settings_ui.dart';
import 'package:pataya_ending_card/app/views/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => locator<SettingsViewModel>(),
        onViewModelReady: (viewModel) async {},
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("SETTINGS"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: const [
                    SettingsItem.header(leading: "Plan"),
                    SettingsItem(
                      leading: "Digicard Free",
                      subtitle: "Contact us to upgrade your plan.",
                    ),
                    SettingsItem.header(leading: "Account"),
                    SettingsItem.header(
                      leading: "Digicard",
                    ),
                    SettingsItem(
                      leading: "Version",
                      trailing: "1.0.0",
                    ),
                    Divider(height: 0),
                    SettingsItem(
                      leading: "Developer",
                      trailing: "Global Webforce",
                    ),
                  ],
                ),
              ));
        });
  }
}
