


import 'package:fish_redux/fish_redux.dart';

enum GlobalAction{changeThemeColor,changeLocale,setUser,setUserPremium}

class GlobalActionCreator{

  static Action onchangeThemeColor(){
    return const Action(GlobalAction.changeThemeColor);
  }


}