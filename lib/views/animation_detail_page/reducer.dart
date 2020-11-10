

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/models/animation_detail_model.dart';
import 'package:flutter_app/views/animation_detail_page/action.dart';
import 'package:flutter_app/views/animation_detail_page/state.dart';

Reducer<AnimationDetailPageState> buildReducer(){
  return asReducer(
    <Object, Reducer<AnimationDetailPageState>>{
      DetailPageAction.initAnimationDetailData:_onInitAnimationDetailData,
    },
  );

}


AnimationDetailPageState _onInitAnimationDetailData(AnimationDetailPageState state,Action action){
  final AnimationDetailModel d=action.payload;
  final  AnimationDetailPageState newState=state.clone();
  newState.animationDetailData=d;
  return newState;
}