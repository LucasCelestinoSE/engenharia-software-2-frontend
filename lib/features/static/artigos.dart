import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Artigo {
  final String titulo;
  final String url;

  Artigo({required this.titulo, required this.url});
}

class ArtigosScreen extends StatefulWidget {
  const ArtigosScreen({Key? key}) : super(key: key);

  @override
  State<ArtigosScreen> createState() => _ArtigosScreenState();
}

class _ArtigosScreenState extends State<ArtigosScreen> {
  String? _filtroSelecionado;

  // Lista de todos os artigos com títulos e URLs.
  final List<Artigo> _todosArtigos = [
    Artigo(
      titulo: '1. Estratégias para lidar com a ansiedade e o estresse no dia a dia',
      url: 'https://psiquiatriageriatricasp.com.br/estrategias-para-lidar-com-a-ansiedade-e-o-estresse-no-dia-a-dia/',
    ),
    Artigo(
      titulo: '2. A importância do sono no controle da ansiedade e da depressão',
      url: 'https://programasecuida.com.br/blog/importancia-do-sono-controle-ansiedade-depressao',
    ),
    Artigo(
      titulo: '3. Técnicas de relaxamento - Confira formas eficazes de alívio do stress e da ansiedade',
      url: 'https://deape.unicamp.br/arquivo/uploads/tcnicas-de-relaxamento/',
    ),
    Artigo(
      titulo: '4. 10 dicas para desenvolver a autocompaixão',
      url: 'https://www.ibccoaching.com.br/portal/motivacao-pessoal/10-dicas-para-desenvolver-a-autocompaixao/',
    ),
    Artigo(
      titulo: '5. O Impacto das mídias sociais na saúde mental de adolescentes e jovens adultos',
      url: 'https://bjihs.emnuvens.com.br/bjihs/article/view/3893/3991',
    ),
    Artigo(
      titulo: '6. Como identificar sinais precoces de depressão',
      url: 'https://www.gov.br/saude/pt-br/assuntos/saude-de-a-a-z/d/depressao',
    ),
    Artigo(
      titulo: '7. 10 exercícios rápidos de atenção plena para lidar com o estresse e a ansiedade',
      url: 'https://www.ihi.org/pt-br/library/blog/10-quick-mindfulness-exercises-coping-stress-and-anxiety/',
    ),
    Artigo(
      titulo: '8. Relação entre alimentação saudável e prevenção de ansiedade e depressão em adultos: revisão sistemática',
      url: 'https://revistas.unaerp.br/rci/article/view/3173/2445',
    ),
    Artigo(
      titulo: '9. Como driblar a procrastinação de acordo com os estudos recentes',
      url: 'https://institutodepsiquiatriapr.com.br/blog/como-driblar-a-procrastinacao-de-acordo-com-os-estudos-recentes/?utm_source=chatgpt.com',
    ),
    Artigo(
      titulo: '10. Micro-hábitos para saúde mental: Como pequenas mudanças no cotidiano podem reduzir casos de ansiedade e depressão na população geral',
      url: 'https://ojs.editoracognitus.com.br/index.php/revista/article/view/47/55',
    ),
    Artigo(
      titulo: '11. Diferença entre tristeza e depressão: entenda os sinais',
      url: 'https://www.pfizer.com.br/noticias/ultimas-noticias/diferencas-entre-depressao-e-tristeza',
    ),
    Artigo(
      titulo: '12. A importância do autocuidado no tratamento da depressão',
      url: 'https://integrativa.pt/a-importancia-do-autocuidado-no-tratamento-da-depressao/',
    ),
  ];

  // Mapas para os artigos filtrados por categoria, usando a nova classe Artigo.
  final Map<String, List<Artigo>> _artigosFiltradosPorCategoria = {
    'Ansiedade': [
      Artigo(titulo: '1. Estratégias para lidar com a ansiedade e o estresse no dia a dia', url: 'https://psiquiatriageriatricasp.com.br/estrategias-para-lidar-com-a-ansiedade-e-o-estresse-no-dia-a-dia/'),
      Artigo(titulo: '2. A importância do sono no controle da ansiedade e da depressão', url: 'https://programasecuida.com.br/blog/importancia-do-sono-controle-ansiedade-depressao'),
      Artigo(titulo: '3. Técnicas de relaxamento - Confira formas eficazes de alívio do stress e da ansiedade', url: 'https://deape.unicamp.br/arquivo/uploads/tcnicas-de-relaxamento/'),
      Artigo(titulo: '4. 10 dicas para desenvolver a autocompaixão', url: 'https://www.ibccoaching.com.br/portal/motivacao-pessoal/10-dicas-para-desenvolver-a-autocompaixao/'),
      Artigo(titulo: '7. 10 exercícios rápidos de atenção plena para lidar com o estresse e a ansiedade', url: 'https://www.ihi.org/pt-br/library/blog/10-quick-mindfulness-exercises-coping-stress-and-anxiety/'),
      Artigo(titulo: '10. Micro-hábitos para saúde mental: Como pequenas mudanças no cotidiano podem reduzir casos de ansiedade e depressão na população geral', url: 'https://ojs.editoracognitus.com.br/index.php/revista/article/view/47/55'),
    ],
    'Depressão': [
      Artigo(titulo: '2. A importância do sono no controle da ansiedade e da depressão', url: 'https://programasecuida.com.br/blog/importancia-do-sono-controle-ansiedade-depressao'),
      Artigo(titulo: '6. Como identificar sinais precoces de depressão', url: 'https://www.gov.br/saude/pt-br/assuntos/saude-de-a-a-z/d/depressao'),
      Artigo(titulo: '11. Diferença entre tristeza e depressão: entenda os sinais', url: 'https://www.pfizer.com.br/noticias/ultimas-noticias/diferencas-entre-depressao-e-tristeza'),
      Artigo(titulo: '12. A importância do autocuidado no tratamento da depressão', url: 'https://integrativa.pt/a-importancia-do-autocuidado-no-tratamento-da-depressao/'),
    ],
    'Sono': [
      Artigo(titulo: '2. A importância do sono no controle da ansiedade e da depressão', url: 'https://programasecuida.com.br/blog/importancia-do-sono-controle-ansiedade-depressao'),
    ],
    'Técnicas de Relaxamento': [
      Artigo(titulo: '3. Técnicas de relaxamento - Confira formas eficazes de alívio do stress e da ansiedade', url: 'https://deape.unicamp.br/arquivo/uploads/tcnicas-de-relaxamento/'),
      Artigo( titulo: '7. 10 exercícios rápidos de atenção plena para lidar com o estresse e a ansiedade', url: 'https://www.ihi.org/pt-br/library/blog/10-quick-mindfulness-exercises-coping-stress-and-anxiety/'),
    ],
  };

  // Função para abrir o URL
  Future<void> _launchUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Não foi possível abrir o link.'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao abrir o link: $e'),
      ),
    );
  }
}

  @override
Widget build(BuildContext context) {
  final List<Artigo> artigosExibidos = _filtroSelecionado == null
      ? _todosArtigos
      : _artigosFiltradosPorCategoria[_filtroSelecionado] ?? [];

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
      padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 34.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Artigos sobre bem-estar',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterButton('Todos', null),
                const SizedBox(width: 3),
                _buildFilterButton('Ansiedade', 'Ansiedade'),
                const SizedBox(width: 3),
                _buildFilterButton('Depressão', 'Depressão'),
                const SizedBox(width: 3),
                _buildFilterButton('Sono', 'Sono'),
                const SizedBox(width: 3),
                _buildFilterButton('Técnicas de\nrelaxamento', 'Técnicas de Relaxamento'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: artigosExibidos.length,
              itemBuilder: (context, index) {
                final artigo = artigosExibidos[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: () => _launchUrl(artigo.url),
                    child: Text(
                      artigo.titulo,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildFilterButton(String texto, String? filtro) {
    final bool isSelected = _filtroSelecionado == filtro;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _filtroSelecionado = filtro;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.transparent,
        foregroundColor: isSelected ? Colors.white : const Color.fromARGB(255, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey.shade400),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        textStyle: const TextStyle(fontSize: 11),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
      ),
    );
  }
}