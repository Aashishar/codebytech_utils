

import 'package:flutter/material.dart';


class BottomBar extends StatefulWidget {
  /// The name of the route.
  /// 
  static const String routeName = '/actual-home';

  /// The BottomBar widget is a custom widget that displays a bottom navigation bar.
  /// this is made by codebyte tech
  /// require the following parameters:
  /// explore more contribute as well as give feedback on the github page
  /// 
  const BottomBar({
    super.key,
    required this.pages,
    required this.icons,
    required this.lables,
    required this.indicatorColor,
    required this.backgroundColor,
    required this.selectedColor,
    required this.unselectedColor,
    required this.iconSize,
    required this.fontSize,
  });


/// The pages to display in the bottom bar.
/// 
  final List<Widget> pages;

  /// The icons to display in the bottom bar.
  /// icons must be the same length as pages.
  /// icons must be the same length as lables.
  /// 
  final List<Icon> icons;

  /// The lables to display in the bottom bar.
  /// lables must be the same length as pages.
  /// these are the strings that will be displayed under the icons.
  final List<String> lables;

  /// The color of the indicator that appears under the selected item.
  /// 
  final Color indicatorColor;

  /// The color of the background of the bottom bar.
  /// 
  final Color backgroundColor;
  /// The color of the selected item.
  /// 
  final Color selectedColor;

  /// The color of the unselected items.
  final Color unselectedColor;

  /// The size of the icons in the bottom bar.
  final double iconSize;

  /// The size of the font in the bottom bar.
  final double fontSize;


  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  void updatePage(int index) {
    setState(() {
      _page = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    
  List<NavigationDestination> navigationBars = [

    for (int i = 0; i < widget.pages.length; i++)
      NavigationDestination(

        icon: widget.icons[i],
        label: widget.lables[i],
      ),
  ];
    return Scaffold(
        body: widget.pages[_page],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _page,
          height: 80,
          elevation: 0,
          onDestinationSelected: updatePage,
          indicatorColor: widget.indicatorColor ,
          backgroundColor: widget.backgroundColor,
        
          
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: navigationBars
        ));
  }
}
