


import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/views/player_page/effect.dart';
import 'package:flutter_app/views/player_page/reducer.dart';
import 'package:flutter_app/views/player_page/state.dart';

import 'view.dart';

class PlayerPage extends Page<PlayerPageState,Map<String,dynamic>>
with TickerProviderMixin{
  PlayerPage():super(
    initState: initState,
    effect:buildEffect(),
    reducer: buildReducer(),
    shouldUpdate: (o,n){
      return true;
    },
    view:buildView,
  dependencies: Dependencies<PlayerPageState>(
  adapter: null,
      slots: <String, Dependent<PlayerPageState>>{
      }),
        middleware: <Middleware<PlayerPageState>>[],
  );
}