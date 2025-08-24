import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmojiSlider extends StatefulWidget {
  final Function(int)? onValueChanged; // Callback para retornar o valor

  const EmojiSlider({super.key, this.onValueChanged});

  @override
  _EmojiSliderState createState() => _EmojiSliderState();
}

class _EmojiSliderState extends State<EmojiSlider> {
  // O valor inicial do slider, de 1 a 5
  double currentValue = 1;

  // Lista de emojis e seus paths SVG
  final List<String> _emojis = [
    '/assets/images/emoji_vermelho.svg',
    '/assets/images/emoji_azul.svg',
    '/assets/images/emoji_cinza.svg',
    '/assets/images/emoji_amarelo.svg',
    '/assets/images/emoji_verde.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // O Slider
        Slider(
          value: currentValue,
          min: 1,
          max: 5,
          divisions: 4, // 5 posições no total (1, 2, 3, 4, 5)
          activeColor: Colors.black, // Cor da trilha ativa
          inactiveColor: Colors.black, // Cor da trilha inativa
          thumbColor: Colors.white, // Cor do "polegar"
          onChanged: (double newValue) {
            setState(() {
              currentValue = newValue;
            });
            // Chama o callback quando o valor muda
            if (widget.onValueChanged != null) {
              widget.onValueChanged!(newValue.round());
            }
          },
        ),
        

        // A linha de emojis
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _emojis.asMap().entries.map((entry) {
            final int index = entry.key;
            final String emojiPath = entry.value;

            // Define a opacidade
            final double opacity =
                (index + 1) == currentValue.round() ? 1.0 : 0.4;

            // Cria o círculo com o emoji dentro
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentValue = (index + 1).toDouble();
                });
                // Chama o callback quando o emoji é tocado
                if (widget.onValueChanged != null) {
                  widget.onValueChanged!(index + 1);
                }
              },
              child: AnimatedOpacity(
                opacity: opacity,
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration( // Removida a cor de fundo
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      emojiPath,
                      width: 40, // Ajuste o tamanho conforme necessário
                      height: 40,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}