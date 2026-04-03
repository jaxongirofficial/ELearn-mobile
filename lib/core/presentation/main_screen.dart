import 'package:elearn_mobile/features/calculator/presentation/calculator_page.dart';
import 'package:elearn_mobile/features/favourites/presentation/pages/favourites_page.dart';
import 'package:elearn_mobile/features/home/presentation/pages/home_page.dart';
import 'package:elearn_mobile/features/library/presentation/pages/library_page.dart';
import 'package:elearn_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _selectedColor = Color(0xFF2563EB);
  static const _unselectedColor = Color(0xFF94A3B8);
  static const _labelStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    LibraryPage(),
    CalculatorPage(),
    FavouritesPage(),
    ProfilePage(),
  ];

  Widget _navSvgIcon(String assetPath, int index) {
    final isSelected = _currentIndex == index;

    return SvgPicture.asset(
      assetPath,
      width: 22,
      height: 22,
      colorFilter: ColorFilter.mode(
        isSelected ? _selectedColor : _unselectedColor,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: _selectedColor,
        unselectedItemColor: _unselectedColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: _labelStyle,
        unselectedLabelStyle: _labelStyle,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: _navSvgIcon('assets/icons/home.svg', 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon('assets/icons/library.svg', 1),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon('assets/icons/calculator.svg', 2),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon('assets/icons/favorite.svg', 3),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon('assets/icons/person.svg', 4),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
