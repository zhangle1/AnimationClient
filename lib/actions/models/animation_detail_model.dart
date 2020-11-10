// To parse this JSON data, do
//
//     final animationDetailModel = animationDetailModelFromJson(jsonString);

import 'dart:convert';

AnimationDetailModel animationDetailModelFromJson(String str) => AnimationDetailModel.fromJson(json.decode(str));

String animationDetailModelToJson(AnimationDetailModel data) => json.encode(data.toJson());

class AnimationDetailModel {
  AnimationDetailModel({
    this.code,
    this.success,
    this.data,
    this.msg,
  });

  int code;
  bool success;
  Data data;
  String msg;

  factory AnimationDetailModel.fromJson(Map<String, dynamic> json) => AnimationDetailModel(
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
    this.animation,
    this.animationEpisode,
  });

  Animation animation;
  List<AnimationEpisode> animationEpisode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    animation: Animation.fromJson(json["animation"]),
    animationEpisode: List<AnimationEpisode>.from(json["animationEpisode"].map((x) => AnimationEpisode.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "animation": animation.toJson(),
    "animationEpisode": List<dynamic>.from(animationEpisode.map((x) => x.toJson())),
  };
}

class Animation {
  Animation({
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
  DateTime updateTime;
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

  factory Animation.fromJson(Map<String, dynamic> json) => Animation(
    id: json["id"],
    createUser: json["createUser"],
    createDept: json["createDept"],
    createTime: DateTime.parse(json["createTime"]),
    updateUser: json["updateUser"],
    updateTime: DateTime.parse(json["updateTime"]),
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
    "updateTime": updateTime.toIso8601String(),
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

class AnimationEpisode {
  AnimationEpisode({
    this.id,
    this.createUser,
    this.createDept,
    this.createTime,
    this.updateUser,
    this.updateTime,
    this.status,
    this.isDeleted,
    this.animationId,
    this.episodeUrl,
    this.episodeName,
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
  String animationId;
  String episodeUrl;
  String episodeName;
  int sort;

  factory AnimationEpisode.fromJson(Map<String, dynamic> json) => AnimationEpisode(
    id: json["id"],
    createUser: json["createUser"].toString(),
    createDept: json["createDept"].toString(),
    createTime: DateTime.parse(json["createTime"]),
    updateUser: json["updateUser"].toString(),
    updateTime: DateTime.parse(json["updateTime"]),
    status: json["status"],
    isDeleted: json["isDeleted"],
    animationId: json["animationId"],
    episodeUrl: json["episodeUrl"],
    episodeName: json["episodeName"],
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
    "animationId": animationId,
    "episodeUrl": episodeUrl,
    "episodeName": episodeName,
    "sort": sort,
  };
}
