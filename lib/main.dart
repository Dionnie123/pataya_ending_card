import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pataya_ending_card/app/bottomsheet_ui.dart';
import 'package:pataya_ending_card/app/dialog_ui.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/snackbar_ui.dart';
import 'package:pataya_ending_card/app/routes/app_router.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/constants/colors.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();

  await setupLocator();

  await ThemeManager.initialise();
  await setupSnackBarUI();
  await setupDialogUI();
  await setupBottomSheetUI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = locator<AppRouter>();
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) FlutterNativeSplash.remove();
    return MaterialApp.router(
      key: UniqueKey(),
      title: "Digicard",
      theme: ThemeData(
        colorSchemeSeed: kPrimaryColor,
        // useMaterial3: true,
        // brightness: Brightness.dark,
        bottomSheetTheme: const BottomSheetThemeData(
            elevation: 0, backgroundColor: Colors.transparent),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              // Makes all my ElevatedButton green
              backgroundColor: kPrimaryColor),
        ),
        /*      fontFamily: GoogleFonts.poppins().fontFamily, */
        inputDecorationTheme: const InputDecorationTheme(
          /* contentPadding: EdgeInsets.all(12), */
          isDense: true,
          filled: false,
          border: OutlineInputBorder(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(includePrefixMatches: true),
    );
  }
}
