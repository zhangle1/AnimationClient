

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutter_app/actions/http/base_api.dart';
import 'package:flutter_app/views/animation_detail_page/page.dart';
import 'package:flutter_app/views/home_page/state.dart';

import 'action.dart';

Effect<HomePageState> buildEffect(){
  return combineEffects(<Object,Effect<HomePageState>>{
      HomePageAction.action:_onAction,
      Lifecycle.initState: _onInit,
      Lifecycle.dispose: _onDispose,
      HomePageAction.cellTapped:_onCellTapped,
  });
}


void _onAction(Action action,Context<HomePageState> ctx){}


Future _onInit(Action action,Context<HomePageState> ctx) async{




  final _baseApi=BaseApi.instance;

    final _AnimationHome=await _baseApi.getAnimationHomeList();
    if(_AnimationHome.code==200){
      ctx.dispatch(HomePageActionCreator.initAnimationHomeData(_AnimationHome.result));
    }

}


Future _onCellTapped(Action action,Context<HomePageState> ctx) async{
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


void _onDispose(Action action, Context<HomePageState> ctx){

}






