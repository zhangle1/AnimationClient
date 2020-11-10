// To parse this JSON data, do
//
//     final animationHomeModel = animationHomeModelFromJson(jsonString);

import 'dart:convert';

AnimationHomeModel animationHomeModelFromJson(String str) => AnimationHomeModel.fromJson(json.decode(str));

String animationHomeModelToJson(AnimationHomeModel data) => json.encode(data.toJson());

class AnimationHomeModel {
  AnimationHomeModel({
    this.code,
    this.success,
    this.data,
    this.msg,
  });

  int code;
  bool success;
  Data data;
  String msg;

  factory AnimationHomeModel.fromJson(Map<String, dynamic> json) => AnimationHomeModel(
    code: json["code"],
    success: json["success"],
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "data": data.toJson(),
    "msg": msg,
  };
}

class Data {
  Data({
    this.animationRandomTagLists,
    this.animationCategoryLists,
  });

  List<AnimationRandomTagList> animationRandomTagLists;
  List<AnimationCategoryList> animationCategoryLists;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    animationRandomTagLists: List<AnimationRandomTagList>.from(json["animationRandomTagLists"].map((x) => AnimationRandomTagList.fromJson(x))),
    animationCategoryLists: List<AnimationCategoryList>.from(json["animationCategoryLists"].map((x) => AnimationCategoryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "animationRandomTagLists": List<dynamic>.from(animationRandomTagLists.map((x) => x.toJson())),
    "animationCategoryLists": List<dynamic>.from(animationCategoryLists.map((x) => x.toJson())),
  };
}

class AnimationCategoryList {
  AnimationCategoryList({
    this.animationCategory,
    this.animationList,
  });

  AnimationCategory animationCategory;
  List<Animationa> animationList;

  factory AnimationCategoryList.fromJson(Map<String, dynamic> json) => AnimationCategoryList(
    animationCategory: AnimationCategory.fromJson(json["animationCategory"]),
    animationList: List<Animationa>.from(json["animationList"].map((x) => Animationa.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "animationCategory": animationCategory.toJson(),
    "animationList": List<dynamic>.from(animationList.map((x) => x.toJson())),
  };
}

class AnimationCategory {
  AnimationCategory({
    this.id,
    this.createUser,
    this.createDept,
    this.createTime,
    this.updateUser,
    this.updateTime,
    this.status,
    this.isDeleted,
    this.code,
    this.name,
    this.sort,
  });

  String id;
  String createUser;
  String createDept;
  DateTime createTime;
  String updateUser;
  DateTime updateTime;
  int status;
  int isDeleted;
  String code;
  String name;
  int sort;

  factory AnimationCategory.fromJson(Map<String, dynamic> json) => AnimationCategory(
    id: json["id"],
    createUser: json["createUser"],
    createDept: json["createDept"],
    createTime: DateTime.parse(json["createTime"]),
    updateUser: json["updateUser"],
    updateTime: DateTime.parse(json["updateTime"]),
    status: json["status"],
    isDeleted: json["isDeleted"],
    code: json["code"],
    name: json["name"],
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createUser": createUser,
    "createDept": createDept,
    "createTime": createTime.toIso8601String(),
    "updateUser": updateUser,
    "updateTime": updateTime.toIso8601String(),
    "status": status,
    "isDeleted": isDeleted,
    "code": code,
    "name": name,
    "sort": sort,
  };
}

class Animationa {
  Animationa({
    this.id,
    this.createUser,
    this.createDept,
    this.createTime,
    this.updateUser,
    this.updateTime,
    this.status,
    this.isDeleted,
    this.name,
    this.detail,
    this.introduction,
    this.supervisionLabel,
    this.seiyuuLabel,
    this.actorLabel,
    this.year,
    this.month,
    this.playStatus,
    this.updateAnimationUrlUpdateStatus,
    this.updateAnimationUrlType,
    this.onShelf,
    this.updateAnimationUrl,
    this.playbackInterval,
    this.animationUpdateTime,
    this.picThumbnailUrl,
    this.picDetailUrl,
    this.tagId,
    this.createTimeStart,
    this.createTimeEnd,
    this.animationOrderType,
  });

  String id;
  String createUser;
  String createDept;
  DateTime createTime;
  String updateUser;
  String updateTime;
  int status;
  int isDeleted;
  String name;
  String detail;
  String introduction;
  String supervisionLabel;
  String seiyuuLabel;
  String actorLabel;
  int year;
  int month;
  int playStatus;
  int updateAnimationUrlUpdateStatus;
  int updateAnimationUrlType;
  int onShelf;
  String updateAnimationUrl;
  int playbackInterval;
  String animationUpdateTime;
  String picThumbnailUrl;
  String picDetailUrl;
  String tagId;
  String createTimeStart;
  String createTimeEnd;
  int animationOrderType;

  factory Animationa.fromJson(Map<String, dynamic> json) => Animationa(
    id: json["id"],
    createUser: json["createUser"],
    createDept: json["createDept"],
    createTime: DateTime.parse(json["createTime"]),
    updateUser: json["updateUser"],
    updateTime: json["updateTime"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    name: json["name"],
    detail: json["detail"],
    introduction: json["introduction"],
    supervisionLabel: json["supervisionLabel"],
    seiyuuLabel: json["seiyuuLabel"],
    actorLabel: json["actorLabel"],
    year: json["year"],
    month: json["month"],
    playStatus: json["playStatus"],
    updateAnimationUrlUpdateStatus: json["updateAnimationUrlUpdateStatus"],
    updateAnimationUrlType: json["updateAnimationUrlType"],
    onShelf: json["onShelf"],
    updateAnimationUrl: json["updateAnimationUrl"],
    playbackInterval: json["playbackInterval"],
    animationUpdateTime: json["animationUpdateTime"],
    picThumbnailUrl: json["picThumbnailUrl"],
    picDetailUrl: json["picDetailUrl"],
    tagId: json["tagId"],
    createTimeStart: json["createTimeStart"],
    createTimeEnd: json["createTimeEnd"],
    animationOrderType: json["animationOrderType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createUser": createUser,
    "createDept": createDept,
    "createTime": createTime.toIso8601String(),
    "updateUser": updateUser,
    "updateTime": updateTime,
    "status": status,
    "isDeleted": isDeleted,
    "name": name,
    "detail": detail,
    "introduction": introduction,
    "supervisionLabel": supervisionLabel,
    "seiyuuLabel": seiyuuLabel,
    "actorLabel": actorLabel,
    "year": year,
    "month": month,
    "playStatus": playStatus,
    "updateAnimationUrlUpdateStatus": updateAnimationUrlUpdateStatus,
    "updateAnimationUrlType": updateAnimationUrlType,
    "onShelf": onShelf,
    "updateAnimationUrl": updateAnimationUrl,
    "playbackInterval": playbackInterval,
    "animationUpdateTime": animationUpdateTime,
    "picThumbnailUrl": picThumbnailUrl,
    "picDetailUrl": picDetailUrl,
    "tagId": tagId,
    "createTimeStart": createTimeStart,
    "createTimeEnd": createTimeEnd,
    "animationOrderType": animationOrderType,
  };
}

class AnimationRandomTagList {
  AnimationRandomTagList({
    this.dictBiz,
    this.animationVo,
  });

  DictBiz dictBiz;
  List<Animationa> animationVo;

  factory AnimationRandomTagList.fromJson(Map<String, dynamic> json) => AnimationRandomTagList(
    dictBiz: DictBiz.fromJson(json["dictBiz"]),
    animationVo: List<Animationa>.from(json["animationVO"].map((x) => Animationa.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dictBiz": dictBiz.toJson(),
    "animationVO": List<dynamic>.from(animationVo.map((x) => x.toJson())),
  };
}

class DictBiz {
  DictBiz({
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
  String code;
  String dictKey;
  String dictValue;
  int sort;
  String remark;
  int isSealed;
  int isDeleted;

  factory DictBiz.fromJson(Map<String, dynamic> json) => DictBiz(
    id: json["id"],
    tenantId: json["tenantId"],
    parentId: json["parentId"],
    code: json["code"],
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
    "code": code,
    "dictKey": dictKey,
    "dictValue": dictValue,
    "sort": sort,
    "remark": remark,
    "isSealed": isSealed,
    "isDeleted": isDeleted,
  };
}
