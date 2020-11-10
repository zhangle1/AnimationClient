import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/actions/adapt.dart';
import 'package:flutter_app/actions/models/animation_search_filter_model.dart';
import 'package:flutter_app/actions/models/animation_search_item_model.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/search_page/action.dart';
import 'package:flutter_app/views/search_page/state.dart';
import 'package:flutter_app/widgets/load_image.dart';

Widget buildView(AnimationSearchPageState state, Dispatch dispatch,
    ViewService viewService) {
  var animationSearchFilterModel = state.animationSearchFilterModel;
  var animationSearchItemModel = state.animationSearchItemModel;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 32.0,
              decoration: BoxDecoration(
                color: Colours.dark_material_bg,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: TextField(
                textAlign: TextAlign.left,
                key: const Key('search_text_field'),
                style: TextStyle(color: Colors.white),
//          autofocus: true,
                controller: state.controller,
                focusNode: state.focus,
                maxLines: 1,
                textInputAction: TextInputAction.search,
                onSubmitted: (val) {
                  state.focus.unfocus();
                  dispatch(SearchPageActionCreator.selectChange(state.animationSearchFilterModel, -1, -1,'search',state.controller.text));
                  // 点击软键盘的动作按钮时的回调
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 8.0, left: -8.0, right: -16.0, bottom: 8),
                  border: InputBorder.none,
                  icon: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                    child: LoadAssetImage(
                      'order/order_search',
                      color: Colours.dark_text_gray,
                    ),
                  ),
                  hintText: "请输入要搜索的动画",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: GestureDetector(
                    child: Semantics(
                      label: '清空',
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8.0, bottom: 8.0),
                        child: LoadAssetImage('order/order_delete',
                            color: Colours.dark_text_gray),
                      ),
                    ),
                    onTap: () {
                      /// https://github.com/flutter/flutter/issues/35848
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        state.controller.text = '';
                        dispatch(SearchPageActionCreator.selectChange(state.animationSearchFilterModel, -1, -1,'search',state.controller.text));
                        state.focus.unfocus();
                      });
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    body: state.animationSearchFilterModel != null
        ? Container(
            color: Colours.background,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...createAnimationFilter(
                      animationSearchFilterModel, dispatch,state.controller.text),
                  animationSearchItemModel!=null?

                  Card(
                    color: Colors.black12,
                    child: buildGridView(dispatch,
                        animationSearchItemModel ),
                  )
                  :SizedBox(height: 1,),

                ],
              ),
            ))
        : Container(
            height: double.infinity,
            width: double.infinity,
            color: Colours.background,
          ),
  );
}

Widget buildGridView(Dispatch dispatch, AnimationSearchItemModel animationSearchItemModel) {
  return GridView.builder(


    physics: BouncingScrollPhysics(),

    shrinkWrap: true,
    itemCount: animationSearchItemModel.data.records.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        childAspectRatio: 0.55),
    itemBuilder: (context, index) {
      return Column(
        key: ValueKey('headercell'),
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Log.e("search page tag"+animationSearchItemModel.data.records[index].id);
              dispatch(SearchPageActionCreator.goDetail(animationSearchItemModel.data.records[index].id));

            },
            key: ValueKey('${index}'),
            child: Container(
              width: Adapt.px(200),
              height: Adapt.px(200),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(57, 57, 57, 1),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(animationSearchItemModel.data.records[index].picDetailUrl),
                  )),
            ),
          ),
          SizedBox(
            height: Adapt.px(10),
          ),
          Container(
            alignment: Alignment.center,
            width: Adapt.px(200),
            height: Adapt.px(70),
            child: Text(
              animationSearchItemModel.data.records[index].name,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: Adapt.px(26),
              ),
            ),
          )
        ],
      );
    },
  );
}


List<Widget> createAnimationFilter(
    AnimationSearchFilterModel animationSearchFilterModel, Dispatch dispatch, String name) {
  Log.e('search page createAnimationFilter 进来了');
  List<Widget> list = [];

  animationSearchFilterModel.data.asMap().forEach((indexLabel, value) {
    // list.add(
    //     Expanded( child:
    //     ListView.builder(
    //   itemCount: value.dicList.length,
    //   shrinkWrap: true,
    //   controller: ScrollController(),
    //   padding: EdgeInsets.all(10),
    //   scrollDirection: Axis.horizontal,
    //   itemBuilder: (context, index) {
    //     return Text(
    //       value.dicList[index].dictKey,
    //       style: TextStyle(
    //           color: value.currentPosition != -1
    //               ? Colours.bottom_tab_item_unselect
    //               : Colours.bottom_tab_item_select),
    //     );
    //   },
    // )));

    list.add(Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              value.defaultLabel,
              style: TextStyle(
                  height: 1.1,
                  color: value.currentPosition != -1
                      ? Colours.bottom_tab_item_unselect
                      : Colours.bottom_tab_item_select),
            )),
        Expanded(
            flex: 9,
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: value.dicList.length,
                shrinkWrap: true,
                controller: ScrollController(),
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: ()=>dispatch(SearchPageActionCreator.selectChange(
                        animationSearchFilterModel, indexLabel, index,'filter',name)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          value.dicList[index]?.dictValue ?? "",
                          style: TextStyle(
                              height: 1.1,
                              color: value.currentPosition != index
                                  ? Colours.bottom_tab_item_unselect
                                  : Colours.bottom_tab_item_select),
                        )),
                  );
                },
              ),
            )),
      ],
    ));
  });
  //

  return list;
}
