import 'package:auto_route/auto_route.dart';
import 'package:pataya_ending_card/app/app.logger.dart';
import 'package:pataya_ending_card/app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

@RoutePage()
class CardShellView extends AutoRouter {
  const CardShellView({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  final log = getLogger('AppRouter');

  bool isAuthenticated = false;
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey: StackedService.navigatorKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/',
          page: CardRoute.page,
        ),
      ];
}

class $AppRoute {}
