import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter_app/actions/models/animation_home_model.dart';

class HomePageState implements Cloneable<HomePageState>{
  AnimationHomeModel animationHomeData;




  @override
  HomePageState clone() {
    return HomePageState()
    ..animationHomeData=animationHomeData;
  }



}


HomePageState initState(Map<String,dynamic> args){
  var state =HomePageState();
  state.animationHomeData=new AnimationHomeModel();
  return state;
}