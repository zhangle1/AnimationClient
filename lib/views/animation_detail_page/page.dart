

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/views/animation_detail_page/state.dart';
import 'package:flutter_app/views/animation_detail_page/view.dart';

import 'effect.dart';
import 'reducer.dart';

class AnimationDetailPage extends Page<AnimationDetailPageState,Map<String,dynamic>>
  with TickerProviderMixin{


  AnimationDetailPage():super(
    initState:initState,
    effect:buildEffect(),
    reducer: buildReducer(),
    shouldUpdate: (o, n) {
      return true;
    },
    view:buildView,
    dependencies: Dependencies<AnimationDetailPageState>(
      adapter: null,
        slots: <String, Dependent<AnimationDetailPageState>>{
        }),
    middleware: <Middleware<AnimationDetailPageState>>[],
  );
}
