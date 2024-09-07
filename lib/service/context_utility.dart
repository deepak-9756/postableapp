import 'package:flutter/material.dart';

class ContextUtitlity {
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get naviogatorKey => _navigatorKey;

  static NavigatorState? get navigator => naviogatorKey.currentState;

  static BuildContext? get context => navigator?.overlay?.context;
}
