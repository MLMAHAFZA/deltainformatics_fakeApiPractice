import 'package:deltainformatics/features/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:deltainformatics/features/bottom_nav_bar/bloc/bottom_nav_bar_states.dart';
import 'package:deltainformatics/features/create_product/view/create_product_screen.dart';
import 'package:deltainformatics/features/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/theme.dart';
import '../../categories/view/category_screen.dart';
import '../bloc/bottom_nav_bar_events.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navBar = BottomNavBarBloc();
    return BlocBuilder<BottomNavBarBloc, BottomNavBarStates>(
        bloc: navBar,
        builder: (context, state) => Scaffold(
            body: Stack(
                children: [_stackScreenUI(navBar), _bottomNavBarUI(navBar)],
              ),
        ));
  }

  _stackScreenUI(BottomNavBarBloc navBar) {
    return  IndexedStack(
        index: navBar.state.currentIndex,
        children: [
          HomeScreen(),
          CategoryScreen(),
          CreateProductScreen(),
        ],
      );

  }

  _bottomNavBarUI(BottomNavBarBloc navBar) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        width: double.infinity,
        height: navHeight,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 4,
                  offset: const Offset(3, 3))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CupertinoTabBar(
            backgroundColor: Colors.white,
            onTap: (index) {
              navBar.add(BottomNavBarClick(index: index));
            },
            items: [
              navItem(
                navColor: homePagePrimeColor,
                navIcon: Icons.dashboard_customize_outlined,
              ),
              navItem(
                navColor: postsPagePrimeColor,
                navIcon: Icons.category_outlined,
              ),
              navItem(
                navColor: albumsPagePrimeColor,
                navIcon: Icons.people_alt_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Item shape nav bar
  BottomNavigationBarItem navItem(
      {required Color navColor, required IconData navIcon}) {
    return BottomNavigationBarItem(
        icon: CircleAvatar(
          backgroundColor: navColor,
         child: Icon(
        navIcon,
        color: Colors.white,
      ),
    ));
  }
}
