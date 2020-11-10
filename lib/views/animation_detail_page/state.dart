import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/actions/models/animation_detail_model.dart';

class AnimationDetailPageState implements Cloneable<AnimationDetailPageState> {
  GlobalKey<ScaffoldState> scaffoldKey;
  String animationId;

  ScrollController scrollController;

  AnimationDetailModel animationDetailData;

  @override
  AnimationDetailPageState clone() {
    return AnimationDetailPageState()
      ..animationId = animationId
      ..scrollController = scrollController
      ..scaffoldKey = scaffoldKey;
  }
}

AnimationDetailPageState initState(Map<String, dynamic> args) {
  AnimationDetailPageState state = AnimationDetailPageState();
  state.scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: ' _AnimationDetailPageKey');
  state.animationId = args['animationId'];
  state.animationDetailData = AnimationDetailModel();

  return state;
}
