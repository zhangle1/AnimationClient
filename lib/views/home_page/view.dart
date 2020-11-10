import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/actions/adapt.dart';
import 'package:flutter_app/actions/models/animation_home_model.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/style/themestyle.dart';
import 'package:shimmer/shimmer.dart';


import 'action.dart';
import 'state.dart';

Widget buildView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {
  return Builder(
    builder: (context) {
      final ThemeData _theme = ThemeStyle.getTheme(context);
      var categoryLists = state.animationHomeData.data?.animationCategoryLists;
      List<Widget> categoryWidgets = [];
      var tagLists = state.animationHomeData.data?.animationRandomTagLists;
      List<Widget> tagWidgets = [];

      if (categoryLists!=null&&categoryLists.length != 0) {
        categoryLists.forEach((element) {
          categoryWidgets.add(createWidgetItem(element, dispatch));
        });
      }

      if (tagLists!=null&&tagLists.length != 0) {
        tagLists.forEach((b) {
          tagWidgets.add(createTagWidgetItem(b, dispatch));
        });
      }

      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            brightness: Brightness.dark,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            title: _SearchBar(
              onTap: () => dispatch(HomePageActionCreator.onSearchBarTapped()),
            )),
        body: Container(
            color: Colours.background,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [...categoryWidgets,...tagWidgets],
              ),
            )),
      );
    },
  );
}

Widget createTagWidgetItem(AnimationRandomTagList b, dispatch) {
  return _CategoryItem(
    dispatch: dispatch,
    onMore: () {},
    labelText: b.dictBiz.dictValue,
    type: 'tag',
    tagModel: b,
  );
}

Widget createWidgetItem(AnimationCategoryList e, dispatch) {
  return _CategoryItem(
    dispatch: dispatch,
    onMore: () {},
    labelText: e.animationCategory.name,
    type: 'category',
    categoryModel: e,
  );
}

class _SearchBar extends StatelessWidget {
  final Function onTap;

  const _SearchBar({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: Adapt.px(30), right: Adapt.px(30)),
        height: Adapt.px(70),
        decoration: BoxDecoration(
          color: Colours.background,
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "动画小屋",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: Adapt.px(32)),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Dispatch dispatch;
  final Function onMore;
  final String labelText;
  final String type;
  final AnimationCategoryList categoryModel;
  final AnimationRandomTagList tagModel;

  _CategoryItem(
      {this.dispatch,
      this.onMore,
      this.labelText = "分类",
      this.type,
      this.categoryModel,
      this.tagModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Adapt.px(12), top: Adapt.px(10), right: Adapt.px(12)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: Adapt.px(10), bottom: Adapt.px(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    this.labelText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: Colors.white, fontSize: Adapt.px(32)),
                  ),
                ),
                InkWell(
                  onTap: ()=>{},
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
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
              child: type == 'tag'
                  ? tagModel.animationVo.length > 0
                      ? ListView.separated(
                          key: ValueKey(tagModel.dictBiz.dictValue),
                          padding:
                              EdgeInsets.symmetric(horizontal: Adapt.px(30)),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) => SizedBox(
                            width: Adapt.px(30),
                          ),
                          itemCount: tagModel.animationVo.length,
                          itemBuilder: (_, index) {
                            var animationVo = tagModel.animationVo[index];
                            return _HeaderListCell(
                              onTap: () => dispatch(HomePageActionCreator.onCellTapped(animationVo.id)),
                              animationVo: animationVo,
                            );
                          },
                        )
                      : _ShimmerHeaderList()
                  : categoryModel.animationList.length > 0
                      ? ListView.separated(
                          key: ValueKey(categoryModel.animationCategory.name),
                          padding:
                              EdgeInsets.symmetric(horizontal: Adapt.px(30)),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) => SizedBox(
                            width: Adapt.px(30),
                          ),
                          itemCount: categoryModel.animationList.length,
                          itemBuilder: (_, index) {
                            var animationVo = categoryModel.animationList[index];
                            return _HeaderListCell(
                              onTap: () => dispatch(HomePageActionCreator.onCellTapped(animationVo.id)),
                              animationVo: animationVo,
                            );
                          },
                        )
                      : _ShimmerHeaderList(),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderListCell extends StatelessWidget {
  final Function onTap;
  final int count;
  final Animationa animationVo;

  const _HeaderListCell({Key key, this.onTap, this.count, this.animationVo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey('headercell'),
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          key: ValueKey('${count}'),
          child: Container(
            width: Adapt.px(200),
            height: Adapt.px(200),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(57, 57, 57, 1),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(animationVo.picDetailUrl),
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
            animationVo.name,
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
  }
}

class _ShimmerHeaderList extends StatelessWidget {
  final Color _baseColor = Color.fromRGBO(57, 57, 57, 1);
  final Color _highLightColor = Color.fromRGBO(67, 67, 67, 1);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highLightColor,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => _ShimmerHeaderCell(),
        separatorBuilder: (context, index) => SizedBox(width: Adapt.px(30)),
      ),
    );
  }
}

class _ShimmerHeaderCell extends StatelessWidget {
  final Color _baseColor = Color.fromRGBO(57, 57, 57, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: Adapt.px(200),
          height: Adapt.px(280),
          color: _baseColor,
        ),
        SizedBox(
          height: Adapt.px(20),
        ),
        Container(
          width: Adapt.px(200),
          height: Adapt.px(20),
          color: _baseColor,
        ),
        SizedBox(
          height: Adapt.px(8),
        ),
        Container(
          width: Adapt.px(150),
          height: Adapt.px(20),
          color: _baseColor,
        ),
      ],
    );
  }
}
