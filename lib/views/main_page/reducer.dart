
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/views/main_page/action.dart';
import 'package:flutter_app/views/main_page/state.dart';

Reducer<MainPageState> buildReducer(){
   return asReducer(
     <Object,Reducer<MainPageState>>{
       MainPageAction.action:_onAction,
       MainPageAction.tabchanged:_onTabChanged
     },
   );


}

MainPageState _onAction(MainPageState state,Action action){
  final MainPageState newState=state.clone();
  return newState;
}

MainPageState _onTabChanged(MainPageState state,Action action){
  final int newindex=action.payload??0;
  final MainPageState newState=state.clone();
  newState.selectedIndex=newindex;
  return newState;
}
