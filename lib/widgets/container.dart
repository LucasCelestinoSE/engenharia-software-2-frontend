import 'package:flutter/material.dart';
import 'package:testando/widgets/graphical.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339,
      height: 204,
      decoration: BoxDecoration(
        color: const Color(0xFFB6B1A6), // Cor de fundo do container
        borderRadius: BorderRadius.circular(20), // Aumentei o raio da borda para 20
      ),
      child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: GraphicalWidget(),
        ),
    );
  }
}