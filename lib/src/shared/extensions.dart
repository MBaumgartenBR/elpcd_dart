import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget center() => Center(child: this);

  Widget expanded({int flex = 1}) => Expanded(child: this, flex: flex);

  Widget flexible({int flex = 1}) => Flexible(child: this, flex: flex);

  Widget padding({EdgeInsets padding = const EdgeInsets.all(8)}) {
    return Padding(child: this, padding: padding);
  }
}

extension BuildContextExtensions on BuildContext {
  void pop<T extends Object>([T result]) => Navigator.of(this).pop(result);

  Future<T> putRoute<T>(Route<T> route) => Navigator.of(this).push(route);

  Future<T> replaceRoute<T>(Route<T> route) {
    return Navigator.of(this).pushReplacement(route);
  }

  Future<T> display<T>(Widget widget, {bool replaceRoute = false}) {
    var route = MaterialPageRoute<T>(builder: (context) => widget);
    if (replaceRoute) return this.replaceRoute(route);
    return this.putRoute(route);
  }

  ThemeData theme() => Theme.of(this);

  bool isDarkMode() => this.theme().brightness == Brightness.dark;

  Color get primaryColor => this.theme().primaryColor;

  Color get accentColor => this.theme().accentColor;

  Size get mediaQuerySize => MediaQuery.of(this).size;

  bool get isSmallDisplay => this.mediaQuerySize.width < 600;
}