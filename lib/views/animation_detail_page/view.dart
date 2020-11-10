import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Animation;
import 'package:flutter_app/actions/adapt.dart';
import 'package:flutter_app/actions/models/animation_detail_model.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/animation_detail_page/action.dart';
import 'package:flutter_app/views/animation_detail_page/state.dart';
import 'package:flutter_app/widgets/load_image.dart';

Widget buildView(AnimationDetailPageState state, Dispatch dispatch,
    ViewService viewService) {
  return Builder(builder: (context) {
    double buttonWidth = Adapt.screenW() * 0.8;
    var animation = state.animationDetailData?.data?.animation;
    var animationEpisode = state.animationDetailData?.data?.animationEpisode;

    return Scaffold(
      key: state.scaffoldKey,
      backgroundColor: Colours.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        toolbarHeight: Adapt.px(0),
      ),
      body: animation != null
          ? Stack(
              alignment: Alignment.topCenter,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: CachedNetworkImageProvider(
                      //       'http://121.199.14.247:9000/bladex/upload/20200610/84d594e67c73d6731be2ef552f1448f1.webp'),
                      // )
                    ),
                    child: SingleChildScrollView(
                      controller: state.scrollController,
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Adapt.px(20),
                          ),
                          Container(
                            width: Adapt.px(250),
                            height: Adapt.px(350),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(57, 57, 57, 1),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      animation?.picDetailUrl != null
                                          ? animation?.picDetailUrl
                                          : ""),
                                )),
                          ),
                          SizedBox(
                            height: Adapt.px(32),
                          ),
                          Text(
                            animation?.year.toString(),
                            key: Key('b'),
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(
                            height: Adapt.px(24),
                          ),
                          FlatButton(
                            minWidth: buttonWidth,
                            onPressed: () {
                              Log.e("onPress");
                              dispatch(DetailPageActionCreator.onPlayTapped(
                                  animationEpisode[0].episodeUrl));
                            },
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Adapt.px(50))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: Adapt.px(24),
                                ),
                                Text('点击播放',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Adapt.px(10),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Adapt.px(30), right: Adapt.px(30)),
                            child: Text(
                              (animation?.detail ?? ""),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: Adapt.px(8),
                          ),
                          Container(
                            width: Adapt.screenW(),
                            margin: EdgeInsets.only(
                                left: Adapt.px(30), right: Adapt.px(30)),
                            child: Text(
                              '主演:' + animation?.actorLabel ?? "",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: Adapt.px(4),
                          ),
                          Container(
                            width: Adapt.screenW(),
                            margin: EdgeInsets.only(
                                left: Adapt.px(30), right: Adapt.px(30)),
                            child: Text(
                              '监督:' + animation?.supervisionLabel,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: Adapt.px(12),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Adapt.px(30), right: Adapt.px(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //就是字child的垂直布局方向，向上还是向下
                              verticalDirection: VerticalDirection.down,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const LoadSVGAssetImage(
                                      'home/ic_add',
                                      width: 25.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: Adapt.px(6),
                                    ),
                                    Text(
                                      '片单',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const LoadSVGAssetImage(
                                      'home/ic_good',
                                      width: 25.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: Adapt.px(6),
                                    ),
                                    Text(
                                      '评价',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const LoadSVGAssetImage(
                                      'home/ic_share',
                                      width: 25.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: Adapt.px(6),
                                    ),
                                    Text(
                                      '分享',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const LoadSVGAssetImage(
                                      'home/ic_download',
                                      width: 25.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: Adapt.px(6),
                                    ),
                                    Text(
                                      '下载',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Adapt.px(20),
                          ),
                          createAnimationEpisodeWidget(
                              animationEpisode, animation, dispatch)
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {Navigator.pop(context);},
                      key: ValueKey('ddd'),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: Adapt.px(16), right: Adapt.px(16)),
                        height: Adapt.px(56),
                        width: Adapt.px(56),
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                    const Radius.circular(28))),
                            child: LoadSVGAssetImage(
                              'home/ic_fork',
                              width: 28,
                              color: Colors.white,
                            )),
                      ),
                    )),
              ],
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
            ),
    );
  });
}

Widget createAnimationEpisodeWidget(List<AnimationEpisode> animationEpisode,
    Animation animation, Dispatch dispatch) {
  return Column(children: [
    Container(
      padding: EdgeInsets.only(top: Adapt.px(10), bottom: Adapt.px(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '选择剧集',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: Adapt.px(32)),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '共' + animationEpisode.length.toString() + '集全',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: Adapt.px(24)),
                ),
                SizedBox(
                  height: Adapt.px(4),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    ),
    Container(
        height: Adapt.px(280),
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 600),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: ListView.separated(
              key: ValueKey('bbb'),
              padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => SizedBox(
                width: Adapt.px(30),
              ),
              itemCount: animationEpisode.length,
              itemBuilder: (_, index) {
                AnimationEpisode ep = animationEpisode[index];
                return _EpisodeListCell(
                    ep: ep, animation: animation, dispatch: dispatch);
              },
            ))),
  ]);
}

class _EpisodeListCell extends StatelessWidget {
  final AnimationEpisode ep;
  final Animation animation;
  final Dispatch dispatch;

  const _EpisodeListCell({this.ep, this.animation, this.dispatch});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey('headercell'),
      children: <Widget>[
        GestureDetector(
          onTap: () {
            dispatch(DetailPageActionCreator.onPlayTapped(ep.episodeUrl));
          },
          key: ValueKey('ddd'),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: Adapt.px(300),
                height: Adapt.px(150),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(57, 57, 57, 1),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          this.animation.picDetailUrl),
                    )),
              ),
              LoadSVGAssetImage(
                'home/ic_video_play',
                width: 48,
                height: 48,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Adapt.px(10),
        ),
        Container(
          width: Adapt.px(300),
          height: Adapt.px(70),
          child: Text(
            ep.episodeName,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: Adapt.px(26),
            ),
          ),
        )
      ],
    );
  }
}
