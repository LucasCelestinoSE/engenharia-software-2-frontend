import 'package:flutter/material.dart';
import 'package:testando/features/checkins/widgets/fellings_text.dart';
import 'package:testando/widgets/bottom_bar_main.dart';
import 'package:testando/widgets/emoji_slider.dart';
import 'package:testando/widgets/rounded_button.dart';

class CheckinScreen extends StatelessWidget {
  final BuildContext? context;

  const CheckinScreen({Key? key,  this.context}) : super(key: key);

  static String routeName = '/checkin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Como você está se sentindo hoje ?"),
            EmojiSlider(),
            Text("Quais sentimentos resumem seu dia ?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FellingsText(fellingName: "Feliz"),
                FellingsText(fellingName: "Triste"),
                FellingsText(fellingName: "Ansioso"),
                FellingsText(fellingName: "Calmo"),
                FellingsText(fellingName: "Irritado"),
              ],
            ),
            SizedBox(height: 20),
            Text("Comente um pouco sobre esses sentimentos"),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
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