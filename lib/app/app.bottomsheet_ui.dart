import 'package:pataya_ending_card/app/app.locator.dart';

import 'package:stacked_services/stacked_services.dart';

//1. Create name/alias of custom dialog
enum BottomSheetType { digitalCard, send, imagepicker }

Future<void> setupBottomSheetUI() async {
  final bottomSheetService = locator<BottomSheetService>();

//2. Add it on builders
/*   final builders = {};
  bottomSheetService.setCustomSheetBuilders(builders); */
}
