import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_app/actions/http/base_api.dart';
import 'package:flutter_app/views/animation_detail_page/page.dart';
import 'package:flutter_app/views/week_page/action.dart';
import 'package:flutter_app/views/week_page/state.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

Effect<AnimationWeekPageState> buildEffect() {
  return combineEffects(<Object, Effect<AnimationWeekPageState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    WeekPageAction.goDetail:_onGoDetail,
  });
}


Future _onGoDetail(Action action, Context<AnimationWeekPageState> ctx) async {

  final String animationId=action.payload;
  var data={"animationId":animationId};
  Page page= AnimationDetailPage();
  await Navigator.of(ctx.context).push(PageRouteBuilder(
      settings: RouteSettings(name:'detailpage'),
      pageBuilder: (context, animation, secAnimation) {
        return FadeTransition(
          opacity: animation,
          child: page.buildPage(data),
        );
      }
  ));


}


Future _onInit(Action action, Context<AnimationWeekPageState> ctx) async {

  final _baseApi = BaseApi.instance;
  final _AnimationWeek=
        await _baseApi.getAnimationWeekList();
  if(_AnimationWeek.code==200){
    ctx.dispatch(WeekPageActionCreator.initAnimationWeekData(_AnimationWeek.result));
  }

  ItemScrollController scrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener .create();
  ScrollController headerScrollController = ScrollController();

  int currentCategoryIndex = 0;

  ctx.state.scrollController=scrollController;
  ctx.state.currentCategoryIndex=currentCategoryIndex;
  ctx.state.headerScrollController=headerScrollController;
  ctx.state.itemPositionsListener=itemPositionsListener;



}

void _onDispose(Action action, Context<AnimationWeekPageState> ctx) {
  ctx.state.headerScrollController?.dispose();
}


