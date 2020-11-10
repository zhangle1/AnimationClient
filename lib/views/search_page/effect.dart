import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart ' hide Action,Page;
import 'package:flutter_app/actions/http/base_api.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/animation_detail_page/page.dart';
import 'package:flutter_app/views/search_page/action.dart';
import 'package:flutter_app/views/search_page/state.dart';

Effect<AnimationSearchPageState> buildEffect() {
  return combineEffects(<Object, Effect<AnimationSearchPageState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    SearchPageAction.selectChange:_onSelectChange,
    SearchPageAction.goDetail:_onGoDetail,
  });
}




Future _onInit(Action action, Context<AnimationSearchPageState> ctx) async {

  final _baseApi = BaseApi.instance;
  final _AnimationFilterModel=
  await _baseApi.getAnimationSearchFilterModel();
  if(_AnimationFilterModel.code==200){

    _AnimationFilterModel.result.data.forEach((element) {
      element.currentPosition=-1;
    });
    ctx.dispatch(SearchPageActionCreator.initAnimationFilterData(_AnimationFilterModel.result));
    Log.e("getAnimationSearchFilterModel 成功了");
  }else{
    Log.e("getAnimationSearchFilterModel 失败了");

  }
  ctx.state.controller=TextEditingController();



}

Future _onSelectChange(Action action, Context<AnimationSearchPageState> ctx) async {
  Log.e("_onSelectChange effect");
  var payload = action.payload;

  int index = action.payload['index'];
  int labelIndex = action.payload['indexLabel'];
  String name = action.payload['name']??"";
  String type= action.payload['type']??"";

  if(type=='filter') {
    ctx.state.animationSearchFilterModel.data[labelIndex].currentPosition =
        index;
  }
  Map<String,dynamic> data= {"size":50,'current':0,'name':name};

  ctx.state.animationSearchFilterModel.data.forEach((element) {
    if(element.defaultLabel=='年份'&&element.currentPosition!=-1&&element.dicList[element.currentPosition].dictValue!='默认'){
      data['year']=element.dicList[element.currentPosition].dictKey;
      Log.e("position:年份:"+element.currentPosition.toString());
    }
    if(element.defaultLabel=='月份'&&element.currentPosition!=-1&&element.dicList[element.currentPosition].dictValue!='默认'){
      data['month']=element.dicList[element.currentPosition].dictKey;
      Log.e("position:月份:"+element.currentPosition.toString());

    }
    if(element.defaultLabel=='间隔'&&element.currentPosition!=-1&&element.dicList[element.currentPosition].dictValue!='默认'){
      data['playbackInterval']=element.dicList[element.currentPosition].dictKey;
      Log.e("position:间隔:"+element.currentPosition.toString());

    }
    if(element.defaultLabel=='标签'&&element.currentPosition!=-1&&element.dicList[element.currentPosition].dictValue!='默认'){
      data['tagId']=element.dicList[element.currentPosition].dictKey;
      Log.e("position:标签:"+element.currentPosition.toString());
    }
    if(element.defaultLabel=='排序'&&element.currentPosition!=-1&&element.dicList[element.currentPosition].dictValue!='默认'){
      Log.e("position:排序:"+element.currentPosition.toString());

      if(element.dicList[element.currentPosition].dictValue=='热度'){
        data['animationOrderType']=1;
      } else  if(element.dicList[element.currentPosition].dictValue=='热度'){
        data['animationOrderType']=2;
      }
    }
  });

  final _baseApi = BaseApi.instance;
  final _AnimationItemrModel=
  await _baseApi.getAnimationSearchItemList(data);
  if(_AnimationItemrModel.code==200){
    ctx.dispatch(SearchPageActionCreator.changeAnimationItemData(_AnimationItemrModel.result));
  }

}

Future _onGoDetail(Action action, Context<AnimationSearchPageState> ctx) async {
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


void _onDispose(Action action, Context<AnimationSearchPageState> ctx) {
}