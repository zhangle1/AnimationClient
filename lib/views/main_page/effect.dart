import 'dart:isolate';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/views/main_page/action.dart';
import 'package:flutter_app/views/main_page/state.dart';

Effect<MainPageState> buildEffect() {
  return combineEffects(<Object, Effect<MainPageState>>{
    MainPageAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}



ReceivePort _port=ReceivePort();
void _onAction(Action action,Context<MainPageState> ctx){}


void _onInit(Action action, Context<MainPageState> ctx) async {}



void _onDispose(Action action, Context<MainPageState> ctx) {}

