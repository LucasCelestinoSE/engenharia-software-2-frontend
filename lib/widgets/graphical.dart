import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/svg.dart';

class GraphicalWidget extends StatelessWidget {
  const GraphicalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 1:
                      return const Text('D');
                    case 2:
                      return const Text('S');
                    case 3:
                      return const Text('T');
                    case 4:
                      return const Text('Q');
                    case 5:
                      return const Text('Q');
                    case 6:
                      return const Text('S');
                    case 7:
                      return const Text('S');
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 1:
                      return SvgPicture.asset(
                        'images/emoji_vermelho.svg',
                        width: 20,
                        height: 20,
                      );
                     case 2:
                      return SvgPicture.asset(
                        'images/emoji_azul.svg',
                        width: 20,
                        height: 20,
                      );
                    case 3:
                      return SvgPicture.asset(
                        'images/emoji_cinza.svg',
                        width: 20,
                        height: 20,
                      );
                    case 4:
                      return SvgPicture.asset(
                        'images/emoji_amarelo.svg',
                        width: 20,
                        height: 20,
                      );
                    case 5:
                      return SvgPicture.asset(
                        'images/emoji_verde.svg',
                        width: 20,
                        height: 20,
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: Color(0xff37434d), width: 1),    // Eixo Y
              bottom: BorderSide(color: Color(0xff37434d), width: 1),  // Eixo X
              top: BorderSide.none,     // Remove borda superior
              right: BorderSide.none,   // Remove borda direita
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(1, 1),
                FlSpot(2, 2),
                FlSpot(3, 4),
                FlSpot(4, 5),
                FlSpot(5, 3),
                FlSpot(6, 4),
                FlSpot(7, 5),
              ],
              isCurved: true,
              color: Color(0xFF444343),
              barWidth: 5,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          minX: 1,
          maxX: 7,
          minY: 1,
          maxY: 5,
        ),
      ),
    );
  }
}