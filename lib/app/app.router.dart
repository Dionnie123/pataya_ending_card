// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:stacked/stacked.dart' as _i5;
import 'package:stacked_services/stacked_services.dart' as _i4;

import 'constants/action.dart' as _i8;
import 'models/ecard.dart' as _i7;
import 'views/card/card_view.dart' as _i2;
import 'views/home/home_view.dart' as _i1;
import 'views/slots/card_slots_view.dart' as _i3;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i4.StackedService.navigatorKey);

class StackedRouterWeb extends _i5.RootStackRouter {
  StackedRouterWeb({_i6.GlobalKey<_i6.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    CardViewRoute.name: (routeData) {
      final args = routeData.argsAs<CardViewArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CardView(
          key: args.key,
          card: args.card,
          action: args.action,
        ),
      );
    },
    CardSlotsViewRoute.name: (routeData) {
      final args = routeData.argsAs<CardSlotsViewArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.CardSlotsView(
          key: args.key,
          card: args.card,
          action: args.action,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          CardViewRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          CardSlotsViewRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i5.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.CardView]
class CardViewRoute extends _i5.PageRouteInfo<CardViewArgs> {
  CardViewRoute({
    _i6.Key? key,
    required _i7.ECard card,
    required _i8.ActionType action,
  }) : super(
          CardViewRoute.name,
          path: '/',
          args: CardViewArgs(
            key: key,
            card: card,
            action: action,
          ),
        );

  static const String name = 'CardView';
}

class CardViewArgs {
  const CardViewArgs({
    this.key,
    required this.card,
    required this.action,
  });

  final _i6.Key? key;

  final _i7.ECard card;

  final _i8.ActionType action;

  @override
  String toString() {
    return 'CardViewArgs{key: $key, card: $card, action: $action}';
  }
}

/// generated route for
/// [_i3.CardSlotsView]
class CardSlotsViewRoute extends _i5.PageRouteInfo<CardSlotsViewArgs> {
  CardSlotsViewRoute({
    _i6.Key? key,
    required _i7.ECard card,
    required _i8.ActionType action,
  }) : super(
          CardSlotsViewRoute.name,
          path: '/',
          args: CardSlotsViewArgs(
            key: key,
            card: card,
            action: action,
          ),
        );

  static const String name = 'CardSlotsView';
}

class CardSlotsViewArgs {
  const CardSlotsViewArgs({
    this.key,
    required this.card,
    required this.action,
  });

  final _i6.Key? key;

  final _i7.ECard card;

  final _i8.ActionType action;

  @override
  String toString() {
    return 'CardSlotsViewArgs{key: $key, card: $card, action: $action}';
  }
}

extension RouterStateExtension on _i4.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCardView({
    _i6.Key? key,
    required _i7.ECard card,
    required _i8.ActionType action,
    void Function(_i5.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CardViewRoute(
        key: key,
        card: card,
        action: action,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCardSlotsView({
    _i6.Key? key,
    required _i7.ECard card,
    required _i8.ActionType action,
    void Function(_i5.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CardSlotsViewRoute(
        key: key,
        card: card,
        action: action,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCardView({
    _i6.Key? key,
    required _i7.ECard card,
    required _i8.ActionType action,
    void Function(_i5.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CardViewRoute(
        key: key,
        card: card,
        action: action,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCardSlotsView({
    _i6.Key? key,
    required _i7.ECard card,
    required _i8.ActionType action,
    void Function(_i5.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CardSlotsViewRoute(
        key: key,
        card: card,
        action: action,
      ),
      onFailure: onFailure,
    );
  }
}
