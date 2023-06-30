// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:pataya_ending_card/app/models/ecard.dart' as _i7;
import 'package:pataya_ending_card/app/routes/app_router.dart' as _i1;
import 'package:pataya_ending_card/app/views/card/card_slots_view.dart' as _i2;
import 'package:pataya_ending_card/app/views/card/card_view.dart' as _i3;
import 'package:pataya_ending_card/app/views/card/card_viewmodel.dart' as _i8;
import 'package:pataya_ending_card/app/views/home/home_view.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CardShellRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CardShellView(),
      );
    },
    CardSlotsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSlotsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CardSlotsView(
          key: args.key,
          card: args.card,
          action: args.action,
        ),
      );
    },
    CardRoute.name: (routeData) {
      final args =
          routeData.argsAs<CardRouteArgs>(orElse: () => const CardRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CardView(
          key: args.key,
          card: args.card,
          action: args.action,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
  };
}

/// generated route for
/// [_i1.CardShellView]
class CardShellRoute extends _i5.PageRouteInfo<void> {
  const CardShellRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CardShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardShellRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CardSlotsView]
class CardSlotsRoute extends _i5.PageRouteInfo<CardSlotsRouteArgs> {
  CardSlotsRoute({
    _i6.Key? key,
    required _i7.ECard card,
    _i8.ActionType? action,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CardSlotsRoute.name,
          args: CardSlotsRouteArgs(
            key: key,
            card: card,
            action: action,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSlotsRoute';

  static const _i5.PageInfo<CardSlotsRouteArgs> page =
      _i5.PageInfo<CardSlotsRouteArgs>(name);
}

class CardSlotsRouteArgs {
  const CardSlotsRouteArgs({
    this.key,
    required this.card,
    this.action,
  });

  final _i6.Key? key;

  final _i7.ECard card;

  final _i8.ActionType? action;

  @override
  String toString() {
    return 'CardSlotsRouteArgs{key: $key, card: $card, action: $action}';
  }
}

/// generated route for
/// [_i3.CardView]
class CardRoute extends _i5.PageRouteInfo<CardRouteArgs> {
  CardRoute({
    _i6.Key? key,
    _i7.ECard? card,
    _i8.ActionType? action,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CardRoute.name,
          args: CardRouteArgs(
            key: key,
            card: card,
            action: action,
          ),
          initialChildren: children,
        );

  static const String name = 'CardRoute';

  static const _i5.PageInfo<CardRouteArgs> page =
      _i5.PageInfo<CardRouteArgs>(name);
}

class CardRouteArgs {
  const CardRouteArgs({
    this.key,
    this.card,
    this.action,
  });

  final _i6.Key? key;

  final _i7.ECard? card;

  final _i8.ActionType? action;

  @override
  String toString() {
    return 'CardRouteArgs{key: $key, card: $card, action: $action}';
  }
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
