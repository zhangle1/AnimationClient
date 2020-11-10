import 'package:fish_redux/fish_redux.dart';

enum PlayerPageAction{
  action,

}



class PlayerPageActionCreator{


  static Action onAction(){
    return const Action(PlayerPageAction.action);
  }


}