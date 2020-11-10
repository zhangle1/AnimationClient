import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/models/animation_detail_model.dart';

enum DetailPageAction{
    action,
    initAnimationDetailData,
    playTapped,
}


class DetailPageActionCreator{

    static Action initAnimationDetailData(AnimationDetailModel result){
      return Action(DetailPageAction.initAnimationDetailData,payload: result);
    }

  static Action onPlayTapped(String episodeUrl) {
      return Action(DetailPageAction.playTapped,payload:episodeUrl);
  }


}