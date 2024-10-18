import 'package:flutter/material.dart';
import 'package:user/core/contants/colors.dart';
import 'package:user/models/bottom_nav_model.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: bottomNavItems
            .map((item) =>
                BottomNavigationBarItem(icon: item.icon, label: item.label))
            .toList(),
        selectedItemColor: AppColors.iconColor,
        unselectedItemColor: AppColors.unSelectIconColor,
        backgroundColor: AppColors.backgroundColor,
        selectedIconTheme: const IconThemeData(size: 26),
        unselectedIconTheme: const IconThemeData(size: 22),
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: bottomNavItems[_currentIndex].page),
    );
  }
}
