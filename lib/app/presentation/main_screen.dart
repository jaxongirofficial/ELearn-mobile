import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/calculator/presentation/pages/calculator_page.dart';
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
  static const _labelStyle = TextStyle(
    fontSize: 12,
    height: 1.35,
  );

  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    LibraryPage(),
    CalculatorPage(),
    FavouritesPage(),
    ProfilePage(),
  ];

  Widget _navSvgIcon(
    String assetPath,
    int index,
    Color selectedColor,
    Color unselectedColor,
  ) {
    final isSelected = _currentIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: SvgPicture.asset(
        assetPath,
        width: 22,
        height: 22,
        colorFilter: ColorFilter.mode(
          isSelected ? selectedColor : unselectedColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;
    final backgroundColor = theme.scaffoldBackgroundColor;
    final selectedColor = colors.mathematicsPalette.start;
    final unselectedColor = colors.description;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        currentIndex: _currentIndex,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
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
            icon: _navSvgIcon(
              'assets/icons/home.svg',
              0,
              selectedColor,
              unselectedColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon(
              'assets/icons/library.svg',
              1,
              selectedColor,
              unselectedColor,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon(
              'assets/icons/calculator.svg',
              2,
              selectedColor,
              unselectedColor,
            ),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon(
              'assets/icons/favorite.svg',
              3,
              selectedColor,
              unselectedColor,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: _navSvgIcon(
              'assets/icons/person.svg',
              4,
              selectedColor,
              unselectedColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
