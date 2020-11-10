


import 'package:fish_redux/fish_redux.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class PlayerPageState implements Cloneable<PlayerPageState>{

  String url;

  FlickManager flickManager;

  @override
  PlayerPageState clone() {
      return PlayerPageState()
          ..url=url;


  }


}


PlayerPageState initState(Map<String,dynamic> args){
  var state=PlayerPageState();
  state.url=args['url'];

  state.flickManager = FlickManager(
    videoPlayerController:
    VideoPlayerController.network('http://vfx.mtime.cn/Video/2019/03/12/mp4/190312083533415853.mp4'),
  );

  return state;
}
