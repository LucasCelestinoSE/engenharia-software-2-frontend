import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testando/features/checkins/models/emotion_entry.dart';
import 'package:testando/features/checkins/emotion_detail_screen.dart';
import 'package:testando/widgets/bottom_bar_main.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  // --- DADOS MOCKADOS (SUBSTITUIR PELOS DADOS REAIS DO SEU PROVIDER) ---
  // Criei uma lista de dados para simular o que viria da sua API ou banco.
  static final List<EmotionEntry> _mockEntries = [
    EmotionEntry(
      date: DateTime(2025, 8, 14),
      emotion: "Alegria",
      description: "Hoje foi um dia maravilhoso! Consegui finalizar um projeto no trabalho que estava me dando muita dor de cabeça.",
    ),
    EmotionEntry(date: DateTime(2025, 8, 13), emotion: "Alegria", description: "Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria..."
    "Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria..."
    "Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria..."
    "Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria..."
    "Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria...Descrição para Alegria..."),
    EmotionEntry(date: DateTime(2025, 8, 12), emotion: "Angústia", description: "Descrição para Angústia..."),
    EmotionEntry(date: DateTime(2025, 8, 10), emotion: "Ansiedade", description: "Descrição para Ansiedade..."),
    EmotionEntry(date: DateTime(2025, 8, 9), emotion: "Ansiedade", description: "Descrição para Ansiedade..."),
    EmotionEntry(date: DateTime(2025, 8, 8), emotion: "Alegria", description: "Descrição para Alegria..."),
    EmotionEntry(date: DateTime(2025, 8, 7), emotion: "Alegria", description: "Descrição para Alegria..."),
  ];
  // --------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFD9CB),
      appBar: AppBar(
        title: const Text(
          "Histórico de emoções",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _mockEntries.length,
        itemBuilder: (context, index) {
          final entry = _mockEntries[index];
          return _HistoryCard(entry: entry);
        },
      ),
       bottomNavigationBar: BottomBarMain(),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final EmotionEntry entry;

  const _HistoryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmotionDetailScreen(entry: entry),
          ),
        );
      },
      child: Card(
        color: const Color(0xFFCEC8B8),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.only(bottom: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(entry.date),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                entry.emotion,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
