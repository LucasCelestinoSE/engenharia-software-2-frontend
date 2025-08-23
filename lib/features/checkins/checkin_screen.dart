import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/checkins/checkin_provider.dart';
import 'package:testando/features/checkins/widgets/fellings_text.dart';
import 'package:testando/session_manager.dart';
import 'package:testando/widgets/bottom_bar_main.dart';
import 'package:testando/widgets/emoji_slider.dart';
import 'package:testando/widgets/rounded_button.dart';

class CheckinScreen extends StatelessWidget {
  const CheckinScreen({Key? key}) : super(key: key);

  static String routeName = '/checkin';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckinProvider(context.read<UserRepository>(), context.read<SessionManager>()),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Consumer<CheckinProvider>(
            builder: (context, checkinProvider, child) {
              return Center(
                child: Column(
                  children: [
                    Text("Como você está se sentindo hoje ?"),
                    EmojiSlider(
                      onValueChanged: (value) {
                        checkinProvider.setSelectedEmoji(value);
                      },
                    ),
                    Text("Quais sentimentos resumem seu dia ?"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FellingsText(
                            fellingName: "alegria",
                            isSelected: checkinProvider.selectedFeelings.contains("alegria"),
                            onTap: () => checkinProvider.selectSingleFeeling("alegria"),
                          ),
                          FellingsText(
                            fellingName: "Tristeza",
                            isSelected: checkinProvider.selectedFeelings.contains("Tristeza"),
                            onTap: () => checkinProvider.selectSingleFeeling("Tristeza"),
                          ),
                          FellingsText(
                            fellingName: "angustia",
                            isSelected: checkinProvider.selectedFeelings.contains("angustia"),
                            onTap: () => checkinProvider.selectSingleFeeling("angustia"),
                          ),
                          FellingsText(
                            fellingName: "mágoa",
                            isSelected: checkinProvider.selectedFeelings.contains("mágoa"),
                            onTap: () => checkinProvider.selectSingleFeeling("mágoa"),
                          ),
                          FellingsText(
                            fellingName: "ansiedade",
                            isSelected: checkinProvider.selectedFeelings.contains("ansiedade"),
                            onTap: () => checkinProvider.selectSingleFeeling("ansiedade"),
                          ),
                        ],
                      ),
                    SizedBox(height: 20),
                    Text("Comente um pouco sobre esses sentimentos"),
                    SizedBox(height: 60),
                    SizedBox(
                      width: 339,
                      height: 130,
                      child: TextField(
                        maxLines: 5,
                        onChanged: (value) {
                          checkinProvider.setComment(value);
                        },
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
                          child: checkinProvider.isLoading
                              ? CircularProgressIndicator()
                              : RoundedButton(
                                  text: "Registrar Check-in",
                                  onPressed: () async {
                                    final success = await checkinProvider.submitCheckin();
                                    if (success) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Check-in registrado com sucesso!')),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(checkinProvider.errorMessage ?? 'Erro desconhecido')),
                                      );
                                    }
                                  },
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: BottomBarMain(),
        ),
      ),
    );
  }
}