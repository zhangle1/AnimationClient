import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/actions/models/animation_search_filter_model.dart';
import 'package:flutter_app/actions/models/animation_search_item_model.dart';
import 'package:flutter_app/util/log_utils.dart';

enum SearchPageAction {
  action,
  initAnimationFilterData,
  changeAnimationItemData,
  selectChange,
  goDetail,
}

class SearchPageActionCreator {
  static Action onAction() {
    return const Action(SearchPageAction.action);
  }

  static Action initAnimationFilterData(AnimationSearchFilterModel result) {
    return Action(SearchPageAction.initAnimationFilterData, payload: result);
  }

  static Action selectChange(
      AnimationSearchFilterModel animationSearchFilterModel,
      int indexLabel,
      int index, String type, String name) {

    Log.e('labelIndex  Action:'+index.toString());

    return Action(SearchPageAction.selectChange,
        payload: {"indexLabel": indexLabel, "index": index,'type':type,'name':name});
  }

  static Action changeAnimationItemData(AnimationSearchItemModel result) {
    return Action(SearchPageAction.changeAnimationItemData, payload: result);
  }

  static Action goDetail(String id) {
   return  new Action(SearchPageAction.goDetail, payload: id);
  }
}
