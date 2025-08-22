import 'package:flutter/material.dart';

class CheckinScreen extends StatelessWidget {
  const CheckinScreen({super.key});
  static String routeName = '/checkin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check-in"),
      ),
      body: Center(
        child: Text("Tela de Check-in"),
      ),
    );
  }
}