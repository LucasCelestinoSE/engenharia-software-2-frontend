import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testando/data/api/requests/checkins/checkin_response.dart';
import 'package:testando/features/checkins/checkin_provider.dart';
import 'package:testando/features/checkins/models/emotion_entry.dart';
import 'package:testando/features/checkins/emotion_detail_screen.dart';
import 'package:testando/features/profile/profile_provider.dart';
import 'package:testando/utils/custom_date_converter.dart';
import 'package:testando/widgets/bottom_bar_main.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.profileProvider});

  final ProfileProvider profileProvider;


  @override
  Widget build(BuildContext context) {
    profileProvider.getCheckinHistory();
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
        itemCount: profileProvider.historyCheckins.length,
        itemBuilder: (context, index) {
          final entry = profileProvider.historyCheckins[index];
          return _HistoryCard(entry: entry);
        },
      ),
       bottomNavigationBar: BottomBarMain(),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final CheckinResponse entry;

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
        
        print("Ola mundo");
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
                formatCreatedAt(entry.createdAt),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                entry.checkinType.toString(),
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

