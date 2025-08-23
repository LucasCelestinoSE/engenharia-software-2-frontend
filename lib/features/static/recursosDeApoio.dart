import 'package:flutter/material.dart';
import 'package:testando/features/static/artigos.dart';
import 'package:testando/features/static/respiracao.dart';
import 'package:testando/widgets/bottom_bar_main.dart';

class RecursoTelefone {
  final String nome;
  final String numero;

  RecursoTelefone({required this.nome, required this.numero});
}

class RecursosDeApoioScreen extends StatefulWidget {
  const RecursosDeApoioScreen({Key? key}) : super(key: key);
  static const String routeName = '/recursosDeApoio';

  @override
  State<RecursosDeApoioScreen> createState() => _RecursosDeApoioScreenState();
}

class _RecursosDeApoioScreenState extends State<RecursosDeApoioScreen> {
  RecursoTelefone? _telefoneSelecionado;

  final List<RecursoTelefone> _recursosTelefone = [
    RecursoTelefone(nome: 'Centro de Valorização da Vida (CVV)', numero: '188'),
    RecursoTelefone(nome: 'Serviço de Atendimento Móvel de Urgência (SAMU)', numero: '192'),
    RecursoTelefone(nome: 'Polícia Militar', numero: '190'),
    RecursoTelefone(nome: 'Bombeiros', numero: '193'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 235, 222),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Recursos de apoio',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              
              const Text(
                'Telefones para contato',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<RecursoTelefone>(
                    isExpanded: true,
                    value: _telefoneSelecionado,
                    hint: const Text('Selecione um contato'),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: _recursosTelefone.map((RecursoTelefone recurso) {
                      return DropdownMenuItem<RecursoTelefone>(
                        value: recurso,
                        child: Text(recurso.nome),
                      );
                    }).toList(),
                    onChanged: (RecursoTelefone? novoRecurso) {
                      setState(() {
                        _telefoneSelecionado = novoRecurso;
                      });
                    },
                  ),
                ),
              ),
              
              // Exibe o número do telefone selecionado
              if (_telefoneSelecionado != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Número: ${_telefoneSelecionado!.numero}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 32),
              // Botão "Leituras de apoio".
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ArtigosScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 94, 189, 237),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Leituras de apoio',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Botão "Leituras de apoio".
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RespiracaoScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 94, 189, 237),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Exercício de respiração',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBarMain(),
    );
  }
}