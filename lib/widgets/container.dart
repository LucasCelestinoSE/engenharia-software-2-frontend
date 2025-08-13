import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339,
      height: 153,
      decoration: BoxDecoration(
        color: const Color(0xFFB6B1A6), // Cor de fundo do container
        borderRadius: BorderRadius.circular(20), // Aumentei o raio da borda para 20
      ),
      child: const Center(
        child: Text(
          "O gráfico aqui",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // Garante que o texto fique centralizado
        ),
      ),
    );
  }
}