import 'package:edirne_gezgini_ui/util/dependency_injector.dart';
import 'package:edirne_gezgini_ui/view/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';


void main() {
  DependencyInjector.setupDependencies();
  runApp(const BottomNavBar());
}

