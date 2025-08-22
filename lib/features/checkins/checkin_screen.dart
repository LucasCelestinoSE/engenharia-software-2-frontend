import 'package:flutter/material.dart';
import 'package:testando/features/checkins/widgets/fellings_text.dart';
import 'package:testando/widgets/bottom_bar_main.dart';
import 'package:testando/widgets/emoji_slider.dart';
import 'package:testando/widgets/rounded_button.dart';

class CheckinScreen extends StatelessWidget {
  const CheckinScreen({super.key});
  static String routeName = '/checkin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            Text("Como você está se sentindo hoje ?"),
            SizedBox(height: 20),
            EmojiSlider(),
            SizedBox(height: 20),
            
            Text("Quais sentimentos resumem seu dia ?"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FellingsText(fellingName: "Alegria"),
                FellingsText(fellingName: "Tristeza"),
                FellingsText(fellingName: "Angústia"),
                FellingsText(fellingName: "Raiva"),
                FellingsText(fellingName: "Ansiedade"),
              ],
            ),
            SizedBox(height: 20),
            Text("Comente um pouco sobre esses sentimentos"),
            SizedBox(
              width: 339,
              height: 130,
              child: TextField(
                maxLines: 5, // Permite múltiplas linhas
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Escreva aqui...",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0), // Espaçamento inferior
                  child: RoundedButton(text: "Registrar Check-in", onPressed: () {}),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarMain(),
    );
  }
}