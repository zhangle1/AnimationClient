

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/globalbasestate/state.dart';
import 'package:flutter_app/routes/routes.dart';

class MainPageState implements GlobalBaseState,Cloneable<MainPageState>{
  int selectedIndex = 0;
  List<Widget> pages;

  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  MainPageState clone() {
    return MainPageState()
        ..pages=pages
        ..selectedIndex=selectedIndex
        ..scaffoldKey=scaffoldKey;
  }



  @override
  Color themeColor;


}

MainPageState initState(Map<String,dynamic> args){
  return MainPageState()..pages=List<Widget>.unmodifiable([
  Routes.routes.buildPage('homepage', null),
  Routes.routes.buildPage('weekPage', null),
  Routes.routes.buildPage('searchPage', null),
  // Routes.routes.buildPage('homepage', null),
  ]);
}