import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rikmorti/resources/resources.dart';

import '../theme/app_colors.dart';
import '../theme/themeProvider.dart';
import 'charecters_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int currentIndex = 0; 
 List<Widget> screens =[
  const CharectersPage(),
   const Scaffold(
    body: Text('2',),
  ),
   const Scaffold(
    body: Text('3',),
  ),
   const Scaffold(
    body: Text('4',),
  ),
 ];
 
  @override
  Widget build(BuildContext context) {
       final vm = context.watch<ThemeProvider>();
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
   backgroundColor: vm.bottomNavigationBar,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.additionalText,
        onTap: (val){
          currentIndex = val;
          setState(() {
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.chars,
             
            ),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.location,
            ),
            label: 'Локациии',
          ),
           BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.episode,
            ),
            label: 'Эпизоды',
          ),
           BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.settings,
            ),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
