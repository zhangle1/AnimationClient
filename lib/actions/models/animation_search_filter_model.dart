// To parse this JSON data, do
//
//     final animationSearchFilterModel = animationSearchFilterModelFromJson(jsonString);

import 'dart:convert';

AnimationSearchFilterModel animationSearchFilterModelFromJson(String str) => AnimationSearchFilterModel.fromJson(json.decode(str));

String animationSearchFilterModelToJson(AnimationSearchFilterModel data) => json.encode(data.toJson());

class AnimationSearchFilterModel {
  AnimationSearchFilterModel({
    this.code,
    this.success,
    this.data,
    this.msg,
  });

  int code;
  bool success;
  List<Datum> data;
  String msg;

  factory AnimationSearchFilterModel.fromJson(Map<String, dynamic> json) => AnimationSearchFilterModel(
    code: json["code"],
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "msg": msg,
  };
}

class Datum {
  int currentPosition;

  Datum({
    this.dicList,
    this.defaultLabel,
    this.order,
  });

  List<DicList> dicList;
  String defaultLabel;
  int order;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    dicList: List<DicList>.from(json["dicList"].map((x) => DicList.fromJson(x))),
    defaultLabel: json["defaultLabel"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "dicList": List<dynamic>.from(dicList.map((x) => x.toJson())),
    "defaultLabel": defaultLabel,
    "order": order,
  };
}

class DicList {
  DicList({
    this.id,
    this.tenantId,
    this.parentId,
    this.code,
    this.dictKey,
    this.dictValue,
    this.sort,
    this.remark,
    this.isSealed,
    this.isDeleted,
  });

  int id;
  String tenantId;
  int parentId;
  Code code;
  String dictKey;
  String dictValue;
  int sort;
  String remark;
  int isSealed;
  int isDeleted;

  factory DicList.fromJson(Map<String, dynamic> json) => DicList(
    id: json["id"],
    tenantId: json["tenantId"],
    parentId: json["parentId"],
    code: codeValues.map[json["code"]],
    dictKey: json["dictKey"],
    dictValue: json["dictValue"],
    sort: json["sort"],
    remark: json["remark"],
    isSealed: json["isSealed"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tenantId": tenantId,
    "parentId": parentId,
    "code": codeValues.reverse[code],
    "dictKey": dictKey,
    "dictValue": dictValue,
    "sort": sort,
    "remark": remark,
    "isSealed": isSealed,
    "isDeleted": isDeleted,
  };
}

enum Code { BAS_ANIMATION_YEAR_FILTER, BAS_ANIMATION_MONTH_FILTER, BAS_ANIMATION_PLAYBACK_INTERVAL, BAS_ANIMATION_TAG_FILTER, BAS_ANIMATION_ORDER_FILTER }

final codeValues = EnumValues({
  "bas_animation_month_filter": Code.BAS_ANIMATION_MONTH_FILTER,
  "bas_animation_order_filter": Code.BAS_ANIMATION_ORDER_FILTER,
  "bas_animation_playback_interval": Code.BAS_ANIMATION_PLAYBACK_INTERVAL,
  "bas_animation_tag_filter": Code.BAS_ANIMATION_TAG_FILTER,
  "bas_animation_year_filter": Code.BAS_ANIMATION_YEAR_FILTER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
