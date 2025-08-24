import 'package:flutter/material.dart';

class TermosDeUsoScreen extends StatefulWidget {
  const TermosDeUsoScreen({Key? key}) : super(key: key);

  @override
  State<TermosDeUsoScreen> createState() => _TermosDeUsoScreenState();
}

class _TermosDeUsoScreenState extends State<TermosDeUsoScreen> {
  bool _aceitouTermos = false;

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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bem-vindo ao iMood!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Ao utilizar nosso aplicativo, você concorda com os termos abaixo?\n',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(28, 0, 0, 0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1. Finalidade do Aplicativo', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        'O iMood tem como objetivo auxiliar usuários no acompanhamento do seu estado emocional por meio de check-ins diários. Ele não substitui acompanhamento médico ou psicológico profissional.',
                      ),
                      SizedBox(height: 16),
                      Text('2. Uso Responsável', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        'Você se compromete a utilizar o iMood de forma consciente, respeitando sua saúde e seus limites. Em casos de emergência, procure ajuda profissional ou serviços de atendimento imediato.',
                      ),
                      SizedBox(height: 16),
                      Text('3. Cadastro e Acesso', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        'O uso do iMood pode exigir o fornecimento de informações básicas. Você é responsável por manter seus dados de acesso seguros.',
                      ),
                      SizedBox(height: 16),
                      Text('4. Propriedade Intelectual', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        'Todos os conteúdos, funcionalidades e design do iMood pertencem à equipe desenvolvedora. É proibido copiar, distribuir ou modificar qualquer parte do aplicativo sem autorização prévia.',
                      ),
                      SizedBox(height: 16),
                      Text('5. Modificações nos Termos', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        'Estes termos podem ser atualizados. Notificações serão enviadas no aplicativo sempre que alterações forem feitas.',
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}