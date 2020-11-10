
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/http/base_api.dart';
import 'package:flutter_app/actions/models/animation_search_filter_model.dart';
import 'package:flutter_app/actions/models/animation_search_item_model.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/search_page/state.dart';

import 'action.dart';

Reducer<AnimationSearchPageState> buildReducer(){
  return asReducer(
    <Object, Reducer<AnimationSearchPageState>>{
      SearchPageAction.initAnimationFilterData:_onInitAnimationFilterData,
      // SearchPageAction.selectChange:_onSelectChange,
      SearchPageAction.changeAnimationItemData:_onChangeAnimationItemData,
    },
  );

}

AnimationSearchPageState _onInitAnimationFilterData(AnimationSearchPageState state,Action action){
   final AnimationSearchFilterModel d=action.payload;
   final AnimationSearchPageState newState=state.clone();
   newState.animationSearchFilterModel=d;
   return newState;

}


AnimationSearchPageState _onSelectChange(AnimationSearchPageState state,Action action){
  final AnimationSearchPageState newState=state.clone();
  Log.e('labelIndex: 进来了');

  int labelIndex = action.payload['labelIndex'];
  int index = action.payload['index'];
  Log.e('labelIndex:'+labelIndex.toString());

  return newState;
}

AnimationSearchPageState _onChangeAnimationItemData(AnimationSearchPageState state,Action action){

  Log.e('_onChangeAnimationItemData: 进来了');

  AnimationSearchItemModel animationSearchItemModel=  action.payload;

  final AnimationSearchPageState newState=state.clone();
  newState.animationSearchItemModel=animationSearchItemModel;

  return newState;
}


// AnimationWeekPageState _onInitAnimatioWeekData(AnimationWeekPageState state,Action action){
//   final AnimationWeekModel d=action.payload;
//   final  AnimationWeekPageState newState=state.clone();
//   newState.animationWeekModel=d;
//   return newState;
// }

