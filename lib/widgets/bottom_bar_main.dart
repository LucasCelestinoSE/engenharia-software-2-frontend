// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class BottomBarMain extends StatelessWidget {
//   const BottomBarMain({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       height: 59,
//       color: const Color(0xFF444343),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SvgPicture.asset(
//             'images/person_icon.svg',
//             width: 31,
//             height: 31,
//           ),
//           SvgPicture.asset(
//             'images/correct_icon.svg',
//             width: 31,
//             height: 31,
//           ),
//           SvgPicture.asset(
//             'images/notification_icon.svg',
//             width: 31,
//             height: 31,
//           ),
//           SvgPicture.asset(
//             'images/hand_icon.svg',
//             width: 31,
//             height: 31,
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testando/features/profile/profile_page.dart';
import 'package:testando/features/checkins/checkin_screen.dart';
import 'package:testando/features/reminder/pages/reminder_list_page.dart';
import 'package:testando/features/static/recursosDeApoio.dart';

class BottomBarMain extends StatelessWidget {
  const BottomBarMain({super.key});

  // Lista dos caminhos dos ícones
  final List<String> _iconPaths = const [
    'images/person_icon.svg',      // Índice 0
    'images/correct_icon.svg',     // Índice 1
    'images/notification_icon.svg',// Índice 2
    'images/hand_icon.svg',        // Índice 3
  ];

  // Função que descobre o índice da página atual pela rota
  int _getSelectedIndex(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    switch (currentRoute) {
      case ProfilePage.routeName:
        return 0;
      case CheckinScreen.routeName:
        return 1;
      case ReminderListPage.routeName:
        return 2;
      case RecursosDeApoioScreen.routeName:
        return 3;
      default:
        if (currentRoute == '/') {
            return 0; 
        }
        return -1;
    }
  }


  void _onItemTapped(BuildContext context, int index) {
    final int currentIndex = _getSelectedIndex(context);
    if (currentIndex == index) return; // Não faz nada se já estiver na página

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, ProfilePage.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, CheckinScreen.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, ReminderListPage.routeName);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, RecursosDeApoioScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = _getSelectedIndex(context);

    return BottomAppBar(
      height: 65,
      color: const Color(0xFF444343),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_iconPaths.length, (index) {
          final bool isSelected = selectedIndex == index;
          final Color iconColor = isSelected ? Colors.white : Colors.white.withAlpha(153);

          return IconButton(
            icon: SvgPicture.asset(
              _iconPaths[index],
              width: 31,
              height: 31,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
            onPressed: () => _onItemTapped(context, index),
          );
        }),
      ),
    );
  }
}