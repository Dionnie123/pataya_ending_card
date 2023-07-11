import 'package:flutter/material.dart';
import 'package:pataya_ending_card/ui/common/ui_helpers.dart';

class EzDrawerMenu extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldkey;

  const EzDrawerMenu(this.context, {super.key, required this.scaffoldkey});

  @override
  Widget build(BuildContext context) {
    return isDesktop(context)
        ? const SizedBox.shrink()
        : IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffoldkey.currentState?.openDrawer();
            },
          );
  }
}
