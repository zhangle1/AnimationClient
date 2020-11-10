import 'package:fish_redux/fish_redux.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/actions/adapt.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/player_page/state.dart';
import 'package:flutter_app/widgets/webview_player.dart';
import 'package:neeko/neeko.dart';

Widget buildView(
    PlayerPageState state, Dispatch dispatch, ViewService viewService) {
  Log.e("playerView:" + state.url);

  return Builder(builder: (context) {
    return Scaffold(
      key: GlobalKey<ScaffoldState>(debugLabel: 'player'),
      backgroundColor: Colours.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        toolbarHeight: Adapt.px(0),
      ),
      body: Container(
        // child: FlickVideoPlayer(flickManager: state.flickManager),
        child: WebViewPlayer(streamLink: state.url,filterUrl: state.url,),
      ),
    );
  });
}
