import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      child: BottomNavigationBar(
        elevation: 1,
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.brandPurple,
        unselectedItemColor: CustomColors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          widget.pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/vectors/shop.svg",
                  color: _selectedIndex == 0
                      ? CustomColors.brandPurple
                      : CustomColors.grey.withOpacity(0.8)),
              label: "Loja"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/vectors/cart3.svg",
                  color: _selectedIndex == 1
                      ? CustomColors.brandPurple
                      : CustomColors.grey.withOpacity(0.8)),
              label: "Carrinho"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/vectors/person.svg",
                  color: _selectedIndex == 2
                      ? CustomColors.brandPurple
                      : CustomColors.grey.withOpacity(0.8)),
              label: "Perfil"),
        ],
      ),
    );
  }
}
