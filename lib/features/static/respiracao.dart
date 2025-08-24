import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RespiracaoScreen extends StatefulWidget {
  const RespiracaoScreen({Key? key}) : super(key: key);

  @override
  State<RespiracaoScreen> createState() => _RespiracaoScreenState();
}

class _RespiracaoScreenState extends State<RespiracaoScreen> {
  final _player = AudioPlayer();
  bool _isPlaying = false;
  bool _isLoading = true;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      await _player.setAsset('assets/meditacaoGuiada.mp3');
      // Escuta mudanças no estado do player (play/pause).
      _player.playerStateStream.listen((state) {
        if (state.playing) {
          setState(() {
            _isPlaying = true;
          });
        } else {
          setState(() {
            _isPlaying = false;
          });
        }
      });

      // Escuta a duração do áudio.
      _player.durationStream.listen((duration) {
        if (duration != null) {
          setState(() {
            _duration = duration;
          });
        }
      });

      // Escuta a posição atual do áudio.
      _player.positionStream.listen((position) {
        setState(() {
          _position = position;
        });
      });
    } catch (e) {
      print("Erro ao carregar o áudio: $e");
    } finally {
      setState(() {
        _isLoading = false; // O áudio está pronto, ou o carregamento falhou.
      });
    }
  }

  @override
  void dispose() {
    _player.dispose(); // Libera os recursos do player.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFD9CB),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Respiração guiada',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Use este exercício para se acalmar em momentos de ansiedade. Siga o áudio e respire junto.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            // Condição para exibir o botão ou o indicador de carregamento
            _isLoading
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: () {
                      if (_player.playing) {
                        _player.pause();
                      } else {
                        _player.play();
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 94, 189, 237),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
            const SizedBox(height: 48),

            Slider(
              min: 0.0,
              max: _duration.inMilliseconds.toDouble(),
              value: _position.inMilliseconds.toDouble(),
              onChanged: (value) {
                final position = Duration(milliseconds: value.toInt());
                _player.seek(position);
              },
              activeColor: const Color.fromARGB(255, 94, 189, 237),
              inactiveColor: Colors.grey.shade400,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}