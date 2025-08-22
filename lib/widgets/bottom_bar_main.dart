import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarMain extends StatelessWidget {
  const BottomBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 59,
      color: const Color(0xFF444343),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'images/person_icon.svg',
            width: 31,
            height: 31,
          ),
          SvgPicture.asset(
            'images/correct_icon.svg',
            width: 31,
            height: 31,
          ),
          SvgPicture.asset(
            'images/notification_icon.svg',
            width: 31,
            height: 31,
          ),
          SvgPicture.asset(
            'images/hand_icon.svg',
            width: 31,
            height: 31,
          ),
        ],
      ),
    );
  }
}