import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/actions/adapt.dart';
import 'package:flutter_app/actions/models/animation_week_model.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/util/log_utils.dart';
import 'package:flutter_app/views/week_page/action.dart';
import 'package:flutter_app/views/week_page/state.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

Widget buildView(AnimationWeekPageState state, Dispatch dispatch,
    ViewService viewService) {
  return Builder(builder: (context) {
    var data2 = state.animationWeekModel.data;

    return Scaffold(
      key: state.scaffoldKey,
      backgroundColor: Colours.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        toolbarHeight: Adapt.px(0),
      ),
      body: data2 != null
          ? Column(
        children: [
          Expanded(
            child: buildListViewHeader(state, dispatch),
          ),
          Expanded(
            child: buildListViewContent(state,dispatch),
            flex: 9,
          ),
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

buildListViewContent(AnimationWeekPageState state,Dispatch dispatch) {
  return ScrollablePositionedList.builder(
    itemScrollController: state.scrollController,
    itemPositionsListener: state.itemPositionsListener,
    itemCount: state.animationWeekModel.data.length,
    itemBuilder: (context, index) {

        return AnimationCard(
          dispatch,
          state,
          index,
              (val) {
            fillListPositionValues(val, state);
          },
        );
    },
  );
}

Widget AnimationCard(Dispatch dispatch,AnimationWeekPageState state, int index,
    Function(double val) onHeight) {
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //   var screenH = Adapt.screenH();
  //   onHeight((screenH) /
  //       (state.animationWeekModel.data.length / 4));
  // });
  return Column(

    children: [
      Text("${state.animationWeekModel.data[index].label} ",
        style: state.currentCategoryIndex == index ? TextStyle(color:
        Colours.bottom_tab_item_select
        ) : TextStyle(color:
        Colours.bottom_tab_item_unselect
        ),
      ),
      Card(
        color: Colors.black12,
        child: buildGridViewProducts(dispatch,
            index, state.animationWeekModel.data[index].animationList),
      ),
    ],
  );
}

void fillListPositionValues(double val, AnimationWeekPageState state) {
  if (state.oneItemHeight == 0) {
    state.oneItemHeight = val;
    state.animationWeekModel.data.asMap().forEach((key, value) {
      if (key == 0) {
        state.animationWeekModel.data[key].position = 0;
      } else {
        state.animationWeekModel.data[key].position =
            getListPosition(val, key, state);
      }
    });
  }
}

double getListPosition(double val, int index, AnimationWeekPageState state) =>
    val * (state.animationWeekModel.data[index+1].animationList.length / 4) +
        state.animationWeekModel.data[index].position;


Widget buildGridViewProducts(Dispatch dispatch,int index, List<AnimationList> animationList) {
  return GridView.builder(


    physics: NeverScrollableScrollPhysics(),

    shrinkWrap: true,
    itemCount: animationList.length,
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
              Log.e("week page tag"+animationList[index].id);
              dispatch(WeekPageActionCreator.goDetail(animationList[index].id));

            },
            key: ValueKey('${index}'),
            child: Container(
              width: Adapt.px(200),
              height: Adapt.px(200),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(57, 57, 57, 1),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(animationList[index].picDetailUrl),
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
              animationList[index].name,
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

Widget buildListViewHeader(AnimationWeekPageState state, Dispatch dispatch) {
  return ListView.builder(
    itemCount: state.animationWeekModel.data.length,
    controller: state.headerScrollController,
    padding: EdgeInsets.all(10),
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) =>
        buildPaddingHeaderCard(
            state, index, state.animationWeekModel.data[index], dispatch),
  );
}

Widget buildPaddingHeaderCard(AnimationWeekPageState state, int index,
    Datum data, Dispatch dispatch) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: RaisedButton(
      color: Colors.black,
      onPressed: () => headerListChangePosition(index, state, dispatch),
      child: Text("${data.label ?? ""}",
        style: state.currentCategoryIndex == index ? TextStyle(color:
        Colours.bottom_tab_item_select
        ) : TextStyle(color:
        Colours.bottom_tab_item_unselect
        ),
      ),
      shape: StadiumBorder(),
    ),
  );
}

headerListChangePosition(int index, AnimationWeekPageState state,
    Dispatch dispatch) {
  Log.e("change position" + index.toString());
  dispatch(WeekPageActionCreator.changePosition(index));
  state.scrollController.scrollTo(
      index: index,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOutCubic);

  // state.currentCategoryIndex=index;
  // state.scrollController.animateTo(
  //     state.animationWeekModel.data[index].position,
  //     duration: Duration(seconds: 1),
  //     curve: Curves.ease);
}
