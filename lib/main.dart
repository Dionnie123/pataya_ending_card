import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pataya_ending_card/app/app.router.dart';
import 'package:pataya_ending_card/app/bottomsheet_ui.dart';
import 'package:pataya_ending_card/app/dialog_ui.dart';
import 'package:pataya_ending_card/app/app.locator.dart';
import 'package:pataya_ending_card/app/snackbar_ui.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/constants/colors.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();

  await setupLocator(stackedRouter: stackedRouter);

  await ThemeManager.initialise();
  await setupSnackBarUI();
  await setupDialogUI();
  await setupBottomSheetUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) FlutterNativeSplash.remove();
    return ResponsiveApp(
      builder: (_) => MaterialApp.router(
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
          fontFamily: GoogleFonts.poppins().fontFamily,
          inputDecorationTheme: const InputDecorationTheme(
            /* contentPadding: EdgeInsets.all(12), */
            isDense: true,
            filled: false,
            border: OutlineInputBorder(),
          ),
        ),
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }
}
