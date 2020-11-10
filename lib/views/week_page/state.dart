import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/actions/models/animation_week_model.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AnimationWeekPageState implements Cloneable<AnimationWeekPageState> {
  GlobalKey<ScaffoldState> scaffoldKey;

  AnimationWeekModel animationWeekModel;

  ItemScrollController  scrollController;
  ItemPositionsListener itemPositionsListener;
  int currentCategoryIndex;

  ScrollController headerScrollController;

  double lastIndex=0;

  double oneItemHeight=0;

  @override
  AnimationWeekPageState clone() {
    return AnimationWeekPageState()
      ..animationWeekModel = animationWeekModel
      ..scaffoldKey = scaffoldKey
      ..scrollController=scrollController
      ..itemPositionsListener=itemPositionsListener
      ..currentCategoryIndex=currentCategoryIndex
      ..headerScrollController=headerScrollController
      ..lastIndex=lastIndex
      ..oneItemHeight=oneItemHeight
    ;
  }
}

AnimationWeekPageState initState(Map<String, dynamic> args) {
  AnimationWeekPageState state = AnimationWeekPageState();
  state.scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: ' _AnimationWeekPageKey');
  state.animationWeekModel = AnimationWeekModel();

  return state;
}
