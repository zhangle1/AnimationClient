// To parse this JSON data, do
//
//     final animationWeekModel = animationWeekModelFromJson(jsonString);

import 'dart:convert';

AnimationWeekModel animationWeekModelFromJson(String str) => AnimationWeekModel.fromJson(json.decode(str));

String animationWeekModelToJson(AnimationWeekModel data) => json.encode(data.toJson());

class AnimationWeekModel {
  AnimationWeekModel({
    this.code,
    this.success,
    this.data,
    this.msg,
  });

  int code;
  bool success;
  List<Datum> data;
  String msg;

  factory AnimationWeekModel.fromJson(Map<String, dynamic> json) => AnimationWeekModel(
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
  double position=0;

  Datum({
    this.label,
    this.animationList,
  });

  String label;
  List<AnimationList> animationList;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    label: json["label"],
    animationList: List<AnimationList>.from(json["animationList"].map((x) => AnimationList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "animationList": List<dynamic>.from(animationList.map((x) => x.toJson())),
  };
}

class AnimationList {
  AnimationList({
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
  DateTime animationUpdateTime;
  String picThumbnailUrl;
  String picDetailUrl;
  String tagId;
  String createTimeStart;
  String createTimeEnd;
  int animationOrderType;

  factory AnimationList.fromJson(Map<String, dynamic> json) => AnimationList(
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
    animationUpdateTime: DateTime.parse(json["animationUpdateTime"]),
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
    "animationUpdateTime": animationUpdateTime.toIso8601String(),
    "picThumbnailUrl": picThumbnailUrl,
    "picDetailUrl": picDetailUrl,
    "tagId": tagId,
    "createTimeStart": createTimeStart,
    "createTimeEnd": createTimeEnd,
    "animationOrderType": animationOrderType,
  };
}
