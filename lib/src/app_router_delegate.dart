import 'package:archonit_test/src/app/di/di_scope_provider.dart';
import 'package:archonit_test/src/features/bitcoin/di/bitcoin_scope.dart';
import 'package:archonit_test/src/features/bitcoin/presentation/bitcoin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<AppState> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPage(
        name: 'Iniital route',
        child: DiScopeProvider<IBitcoinScope>(
          scope: BitcoinScope.createScope(context),
          child: const BitcoinScreen(),
        ),
      ).createRoute(context),
    );
  }

  @override
  Future<bool> popRoute() {
    // TODO(me): unimplemented for the app
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(AppState configuration) async {
    // TODO(me): unimplemented for the app
    return;
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppState> {
  @override
  Future<AppState> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(AppState.initial);
  }
}

enum AppState { initial }
