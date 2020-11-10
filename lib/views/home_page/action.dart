import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/models/animation_home_model.dart';

enum HomePageAction{
  action,
  searchBarTapped,
  initAnimationHomeData,
  cellTapped,
}


class HomePageActionCreator{

  static Action onAction(){
    return const Action(HomePageAction.action);
  }

  static Action onSearchBarTapped(){
    return const Action(HomePageAction.searchBarTapped);
  }

  static Action initAnimationHomeData(AnimationHomeModel result) {
    return Action(HomePageAction.initAnimationHomeData,payload: result);
  }

  static Action onCellTapped(String id) {
    return Action(HomePageAction.cellTapped,payload: id);
  }

}