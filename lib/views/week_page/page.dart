import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/views/week_page/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';


class AnimationWeekPage extends Page<AnimationWeekPageState,Map<String,dynamic>>
    with TickerProviderMixin{


  AnimationWeekPage():super(
    initState:initState,
    effect:buildEffect(),
    reducer: buildReducer(),
    shouldUpdate: (o, n) {
      return o.currentCategoryIndex!=n.currentCategoryIndex||true;
    },
    view:buildView,
    dependencies: Dependencies<AnimationWeekPageState>(
        adapter: null,
        slots: <String, Dependent<AnimationWeekPageState>>{
        }),
    middleware: <Middleware<AnimationWeekPageState>>[],
  );
}