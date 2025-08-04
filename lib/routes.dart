import 'package:flutter/material.dart';
import 'package:testando/main.dart';
import 'package:testando/features/main/home_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getAppRoutesOf(BuildContext context) {
    return {
      '/': (context) => const MyHomePage(),
    };
  }
}