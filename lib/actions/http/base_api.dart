import 'package:dio/dio.dart';
import 'package:flutter_app/actions/http/request.dart';
import 'package:flutter_app/actions/models/animation_detail_model.dart';
import 'package:flutter_app/actions/models/animation_home_model.dart';
import 'package:flutter_app/actions/models/animation_search_filter_model.dart';
import 'package:flutter_app/actions/models/animation_search_item_model.dart';
import 'package:flutter_app/actions/models/animation_week_model.dart';
import 'package:flutter_app/actions/models/response_model.dart';

import '../app_config.dart';

class BaseApi {
  BaseApi._();

  static final BaseApi instance = BaseApi._();

  static final String animationHomeUrl =
      '/blade-client/animation-auth/getAnimationHomeInfo';

  static final String animationWeekUrl =
      '/blade-client/animation-auth/getAnimationWeekList';

  static final String animationDetailUrl =
      '/blade-client/animation-auth/getAnimationDetailById?animationId=';

  static final String indexFilterKeySetUrl=
      '/blade-client/animation-auth/indexFilterKeySet';
  static final String indexFilterPageUrl=
      '/blade-client/animation-auth/page';

  final Request _http = Request(AppConfig.instance.baseApiHost);

  Future<ResponseModel<AnimationHomeModel>> getAnimationHomeList() async {
    final String _url = animationHomeUrl;
    final r = await _http.request<AnimationHomeModel>(_url);
    return r;
  }

  Future<ResponseModel<AnimationDetailModel>> getAnimationHomeByDetailId(
      String animationId) async {
    final r = await _http
        .request<AnimationDetailModel>(animationDetailUrl + animationId);
    return r;
  }


  Future<ResponseModel<AnimationWeekModel>> getAnimationWeekList(
      ) async {
    final r = await _http
        .request<AnimationWeekModel>(animationWeekUrl);
    return r;
  }


  Future<ResponseModel<AnimationSearchFilterModel>>  getAnimationSearchFilterModel(
      ) async {
    final r = await _http
        .request<AnimationSearchFilterModel>(indexFilterKeySetUrl);
    return r;
  }

  Future<ResponseModel<AnimationSearchItemModel>>  getAnimationSearchItemList(Map<String,dynamic> map
      ) async {
    final r = await _http
        .request<AnimationSearchItemModel>(indexFilterPageUrl,method: 'GET',queryParameters: map);
    return r;
  }



}
