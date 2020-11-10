import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';


class AnimationSearchPage extends Page<AnimationSearchPageState,Map<String,dynamic>>
    with TickerProviderMixin{


  AnimationSearchPage():super(
    initState:initState,
    effect:buildEffect(),
    reducer: buildReducer(),
    shouldUpdate: (o, n) {
      return true;
    },
    view:buildView,
    dependencies: Dependencies<AnimationSearchPageState>(
        adapter: null,
        slots: <String, Dependent<AnimationSearchPageState>>{
        }),
    middleware: <Middleware<AnimationSearchPageState>>[],
  );
}