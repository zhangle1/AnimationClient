import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/actions/models/animation_search_filter_model.dart';
import 'package:flutter_app/actions/models/animation_search_item_model.dart';

class AnimationSearchPageState implements Cloneable<AnimationSearchPageState> {
  GlobalKey<ScaffoldState> scaffoldKey;
  AnimationSearchFilterModel animationSearchFilterModel;
   TextEditingController controller ;
   FocusNode focus;
  AnimationSearchItemModel animationSearchItemModel;


  @override
  AnimationSearchPageState clone() {
    return AnimationSearchPageState()
      ..scaffoldKey = scaffoldKey
      ..animationSearchFilterModel = animationSearchFilterModel
      ..animationSearchItemModel = animationSearchItemModel
      ..controller = controller
      ..focus = focus
    ;
  }
}

AnimationSearchPageState initState(Map<String, dynamic> args) {
  AnimationSearchPageState state = AnimationSearchPageState();
  state.focus=FocusNode();
  state.controller=TextEditingController();
  state.scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: ' _AnimationSearchPageKey');

  return state;
}