import 'dart:async';
import 'dart:developer';
import 'package:archonit_test/src/app.dart';
import 'package:archonit_test/src/app/di/app_scope.dart';
import 'package:archonit_test/src/app/di/di_scope_provider.dart';
import 'package:archonit_test/src/app/network/app_dio_configurator.dart';
import 'package:archonit_test/src/app/network/urls.dart';
import 'package:flutter/material.dart';

void main() async {
  runZonedGuarded(
    () => runApp(
      DiScopeProvider<IAppScope>(
        scope: AppScope(
          dio: const AppDioConfigurator().create(url: Urls.baseUrl),
        ),
        child: const MyApp(),
      ),
    ),
    (error, stack) =>
        log(error.toString(), error: error, name: 'Error handler'),
  );
}
