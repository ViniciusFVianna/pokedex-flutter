import 'package:flutter/material.dart';

import '../features/home/core/home_locator.dart';
import '../features/wrapper/core/wrapper_locator.dart';

void diSetup(GlobalKey<NavigatorState> navigator) {
  wrapperDidSetup(navigator);
  homeDidSetup(navigator);
}