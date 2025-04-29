import 'package:archonit_test/src/app/di/disposable_object.dart';
import 'package:flutter/widgets.dart';

class DiScopeProvider<T> extends StatefulWidget {
  const DiScopeProvider({
    required this.scope,
    required this.child,
    super.key,
  });
  final T scope;
  final Widget child;

  static T of<T>(BuildContext context, {bool listen = false}) =>
      _DiInheritedWidget.of<T>(context, listen: listen);

  @override
  State<DiScopeProvider> createState() => _DiScopeProviderState();
}

class _DiScopeProviderState<T extends DisposableObject>
    extends State<DiScopeProvider> {
  late final T scope;

  @override
  void initState() {
    super.initState();
    scope = widget.scope;
  }

  @override
  void dispose() {
    scope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DiInheritedWidget(
      scope: widget.scope,
      child: widget.child,
    );
  }
}

class _DiInheritedWidget<T> extends InheritedWidget {
  const _DiInheritedWidget({
    required super.child,
    required this.scope,
  });
  final T scope;

  static T of<T>(BuildContext context, {bool listen = false}) =>
      (listen
          ? context
              .dependOnInheritedWidgetOfExactType<_DiInheritedWidget>()
              ?.scope
          : context
              .getInheritedWidgetOfExactType<_DiInheritedWidget>()
              ?.scope) ??
      providerNotFound();

  static Never providerNotFound() =>
      throw Exception('_DiInheritedWidget could not be founded');

  @override
  bool updateShouldNotify(covariant _DiInheritedWidget oldWidget) {
    return scope != oldWidget.scope;
  }
}
