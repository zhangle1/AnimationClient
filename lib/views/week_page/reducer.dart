import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/models/animation_week_model.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/week_page/action.dart';
import 'package:flutter_app/views/week_page/state.dart';

Reducer<AnimationWeekPageState> buildReducer(){
  return asReducer(
    <Object, Reducer<AnimationWeekPageState>>{
      WeekPageAction.initAnimationWeekData:_onInitAnimatioWeekData,
      WeekPageAction.changePosition: _onChangePosition,
    },
  );

}


AnimationWeekPageState _onInitAnimatioWeekData(AnimationWeekPageState state,Action action){
  final AnimationWeekModel d=action.payload;
  final  AnimationWeekPageState newState=state.clone();
  newState.animationWeekModel=d;
  return newState;
}

AnimationWeekPageState _onChangePosition(AnimationWeekPageState state,Action action){
  final int index=action.payload;
  Log.e("_onChangePosition:"+index.toString());
  final  AnimationWeekPageState newState=state.clone();
  newState.currentCategoryIndex=index;
  newState.lastIndex=0;
  newState.oneItemHeight=0;
  return newState;
}