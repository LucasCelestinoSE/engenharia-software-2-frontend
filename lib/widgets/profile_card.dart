import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final int age;
  final String imagePath;
  final bool isNetworkImage; // Parâmetro para indicar se é uma imagem da web

  const ProfileCard({
    Key? key,
    required this.name,
    required this.age,
    required this.imagePath,
    this.isNetworkImage = false, // Por padrão é falso (imagem local)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      height: 258,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: isNetworkImage 
                    ? NetworkImage(imagePath) // Use NetworkImage para URLs da internet
                    : AssetImage(imagePath) as ImageProvider, // Use AssetImage para arquivos locais
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$age anos',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}