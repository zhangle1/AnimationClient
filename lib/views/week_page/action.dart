
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/models/animation_week_model.dart';

enum WeekPageAction{
  action,
  initAnimationWeekData,
  changePosition,
  goDetail,
}


class WeekPageActionCreator{

  static Action onAction(){
    return const Action(WeekPageAction.action);
  }



  static Action initAnimationWeekData(AnimationWeekModel result) {
    return Action(WeekPageAction.initAnimationWeekData,payload: result);
  }

  static Action changePosition(int index) {
    return Action(WeekPageAction.changePosition,payload: index);

  }

  static Action goDetail(String id) {
    return Action(WeekPageAction.goDetail,payload: id);
  }



}