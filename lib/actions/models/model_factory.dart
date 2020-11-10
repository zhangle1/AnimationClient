import 'dart:math';

import 'package:flutter_app/actions/models/animation_detail_model.dart';
import 'package:flutter_app/actions/models/animation_home_model.dart';
import 'package:flutter_app/actions/models/animation_search_filter_model.dart';
import 'package:flutter_app/actions/models/animation_search_item_model.dart';
import 'package:flutter_app/actions/models/animation_week_model.dart';
import 'package:flutter_app/util/log_utils.dart';

class ModelFactory {
  static T generate<T>(json) {
    Log.e(T.toString() + "测试");

    switch (T.toString()) {
      case 'AnimationHomeModel':
        return AnimationHomeModel.fromJson(json) as T;
      case 'AnimationDetailModel':
        return AnimationDetailModel.fromJson(json) as T;
        break;
      case 'AnimationWeekModel':
        return AnimationWeekModel.fromJson(json) as T;
        break;
      case 'AnimationSearchFilterModel':
        return AnimationSearchFilterModel.fromJson(json) as T;
        break;
      case 'AnimationSearchItemModel':
        return AnimationSearchItemModel.fromJson(json) as T;
        break;
      default:
        return json;
    }
  }
}
