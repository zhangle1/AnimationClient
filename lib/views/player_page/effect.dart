import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/views/player_page/action.dart';
import 'package:flutter_app/views/player_page/state.dart';

Effect<PlayerPageState> buildEffect(){
  return combineEffects(<Object,Effect<PlayerPageState>>{
    PlayerPageAction.action:_onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}


void _onAction(Action action,Context<PlayerPageState> ctx){}


Future _onInit(Action action,Context<PlayerPageState> ctx) async{


}


void _onDispose(Action action, Context<PlayerPageState> ctx){
      ctx.state?.flickManager.dispose();
}