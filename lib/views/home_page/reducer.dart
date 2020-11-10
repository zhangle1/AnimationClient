

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/models/animation_home_model.dart';
import 'package:flutter_app/views/home_page/state.dart';

import 'action.dart';

Reducer<HomePageState> buildReducer(){
    return asReducer(
      <Object,Reducer<HomePageState>>{
        HomePageAction.action:_onAction,
        HomePageAction.initAnimationHomeData:_onInitAnimationHomeData,


      },
    );
}


HomePageState _onAction(HomePageState state,Action action){
  final HomePageState newState=state.clone();
  return newState;
}


HomePageState _onInitAnimationHomeData(HomePageState state,Action action){
  final AnimationHomeModel d=action.payload;
  final HomePageState newState=state.clone();
  newState.animationHomeData=d;
  return newState;
}