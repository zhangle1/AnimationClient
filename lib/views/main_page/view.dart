
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/actions/adapt.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/main_page/action.dart';
import 'package:flutter_app/views/main_page/state.dart';
import 'package:flutter_app/widgets/keepalive_widget.dart';
import 'package:flutter_app/widgets/load_image.dart';

Widget buildView(
  MainPageState state,Dispatch dispatch,ViewService viewService
){
  return Builder(
    builder: (context){
      Adapt.initContext(context);
      final pageController=PageController();
      final _lightTheme = ThemeData.light().copyWith(
          backgroundColor: Colours.background,
          tabBarTheme: TabBarTheme(
              labelColor: Colors.white,
              unselectedLabelColor: Colours.background));
      final _darkTheme = ThemeData.dark().copyWith(
          backgroundColor: Colours.background,
          tabBarTheme: TabBarTheme(
              labelColor: Colors.white, unselectedLabelColor: Colours.background));
      final MediaQueryData _mediaQuery=MediaQuery.of(context);
      final ThemeData _theme =
      _mediaQuery.platformBrightness == Brightness.light
          ? _lightTheme
          : _darkTheme;
      Widget _buildPage(Widget page){
        return KeepAliveWidget(page);
      }
      Log.e(state.pages.toString() ,tag: "page size:");
      return Scaffold(
        key:state.scaffoldKey,
        body:   Center(
          child: Center(
            child: PageView(

              physics: NeverScrollableScrollPhysics(),
              children: state.pages.map(_buildPage).toList(),
              controller: pageController,
              onPageChanged: (int i)=>
                dispatch(MainPageActionCreator.onTabChanged(i)),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items:_buildBottomNavigationBarItem(),
          currentIndex: state.selectedIndex,
          selectedItemColor: Colours.bottom_tab_item_select,
          unselectedItemColor: Colours.bottom_tab_item_unselect,
          onTap: (int index){
            pageController.jumpToPage(index);
          },
          type:BottomNavigationBarType.fixed
        ),
      );
    },

  );



}

List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
  var _appBarTitles = ['首页', '时间线', '搜索']; // , '设置'

  var _tabImages = [
      [
        const LoadSVGAssetImage(
          'home/ic_home',
          width: 25.0,
          color: Colours.bottom_tab_item_unselect,
        ),
        const LoadSVGAssetImage(
          'home/ic_home',
          width: 25.0,
          color: Colours.bottom_tab_item_select,
        ),
      ],
      [
        const LoadSVGAssetImage(
          'home/ic_timeline',
          width: 25.0,
          color: Colours.bottom_tab_item_unselect,
        ),
        const LoadSVGAssetImage(
          'home/ic_timeline',
          width: 25.0,
          color: Colours.bottom_tab_item_select,
        ),
      ],
      [
        const LoadSVGAssetImage(
          'home/ic_search',
          width: 25.0,
          color: Colours.bottom_tab_item_unselect,
        ),
        const LoadSVGAssetImage(
          'home/ic_search',
          width: 25.0,
          color: Colours.bottom_tab_item_select,
        ),
      ],
      // [
      //   const LoadSVGAssetImage(
      //     'home/ic_setting',
      //     width: 25.0,
      //     color: Colours.bottom_tab_item_unselect,
      //   ),
      //   const LoadSVGAssetImage(
      //     'home/ic_setting',
      //     width: 25.0,
      //     color: Colours.bottom_tab_item_select,
      //   ),
      // ]
    ];
    List<BottomNavigationBarItem>  _list = List.generate(4, (i) {
      return BottomNavigationBarItem(
          icon: _tabImages[i][0],
          activeIcon: _tabImages[i][1],
          title: Padding(
            padding: const EdgeInsets.only(top: 1.5),
            child: Text(
              _appBarTitles[i],
              key: Key(_appBarTitles[i]),
            ),
          ));
    });

  return _list;
}


