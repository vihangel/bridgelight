import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybookstore/core/utils/colors.dart';

class BottomBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const BottomBarWidget(
      {Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: MyBookStoreColors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: MyBookStoreColors.white,
        selectedItemColor: MyBookStoreColors.black,
        unselectedItemColor: MyBookStoreColors.subtitleLight,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_home.svg',
                height: 28,
                colorFilter: ColorFilter.mode(
                    selectedIndex == 0 ? Colors.black : Colors.grey,
                    BlendMode.srcIn)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_search.svg',
                height: 28,
                colorFilter: ColorFilter.mode(
                    selectedIndex == 1 ? Colors.black : Colors.grey,
                    BlendMode.srcIn)),
            label: 'Funcionários',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_plus_outline.svg',
                height: 28,
                colorFilter: ColorFilter.mode(
                    selectedIndex == 2 ? Colors.black : Colors.grey,
                    BlendMode.srcIn)),
            label: 'Livros',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_person.svg',
                height: 28,
                colorFilter: ColorFilter.mode(
                    selectedIndex == 3 ? Colors.black : Colors.grey,
                    BlendMode.srcIn)),
            label: 'Meu Perfil',
          ),
        ],
      ),
    );
  }
}
