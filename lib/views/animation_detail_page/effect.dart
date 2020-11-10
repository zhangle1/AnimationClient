import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_app/actions/http/base_api.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/animation_detail_page/action.dart';
import 'package:flutter_app/views/player_page/page.dart';

import 'state.dart';

Effect<AnimationDetailPageState> buildEffect() {
  return combineEffects(<Object, Effect<AnimationDetailPageState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    DetailPageAction.playTapped:_onPlayTapped,
  });
}

Future _onInit(Action action, Context<AnimationDetailPageState> ctx) async {
  ctx.state.scrollController = ScrollController();
  final _baseApi = BaseApi.instance;
  Log.e("animationId detail" + ctx.state.animationId);
  final _AnimationDetail =
      await _baseApi.getAnimationHomeByDetailId(ctx.state.animationId);
  if (_AnimationDetail.code == 200) {
    ctx.dispatch(DetailPageActionCreator.initAnimationDetailData(
        _AnimationDetail.result));
    Log.e('成功了 detail');

  }else{
    Log.e('失败了 detail');

  }
}

void _onDispose(Action action, Context<AnimationDetailPageState> ctx) {
  ctx.state.scrollController?.dispose();
}


Future _onPlayTapped(Action action, Context<AnimationDetailPageState> ctx) async {
  final String url=action.payload;

  Log.e("player url"+url);
  var data={"url":url};
  Page page =PlayerPage();
  await Navigator.of(ctx.context).push(PageRouteBuilder(
      settings: RouteSettings(name:'playerPage'),
      pageBuilder: (context, animation, secAnimation) {
        return FadeTransition(
          opacity: animation,
          child: page.buildPage(data),
        );
      }
  ));
}
