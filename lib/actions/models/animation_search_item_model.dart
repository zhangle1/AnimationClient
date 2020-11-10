// To parse this JSON data, do
//
//     final animationSearchItemModel = animationSearchItemModelFromJson(jsonString);

import 'dart:convert';

AnimationSearchItemModel animationSearchItemModelFromJson(String str) => AnimationSearchItemModel.fromJson(json.decode(str));

String animationSearchItemModelToJson(AnimationSearchItemModel data) => json.encode(data.toJson());

class AnimationSearchItemModel {
  AnimationSearchItemModel({
    this.code,
    this.success,
    this.data,
    this.msg,
  });

  int code;
  bool success;
  Data data;
  String msg;

  factory AnimationSearchItemModel.fromJson(Map<String, dynamic> json) => AnimationSearchItemModel(
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
    this.records,
    this.total,
    this.size,
    this.current,
    this.orders,
    this.hitCount,
    this.searchCount,
    this.pages,
  });

  List<Record> records;
  int total;
  int size;
  int current;
  List<dynamic> orders;
  bool hitCount;
  bool searchCount;
  int pages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    total: json["total"],
    size: json["size"],
    current: json["current"],
    orders: List<dynamic>.from(json["orders"].map((x) => x)),
    hitCount: json["hitCount"],
    searchCount: json["searchCount"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
    "total": total,
    "size": size,
    "current": current,
    "orders": List<dynamic>.from(orders.map((x) => x)),
    "hitCount": hitCount,
    "searchCount": searchCount,
    "pages": pages,
  };
}

class Record {
  Record({
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

  factory Record.fromJson(Map<String, dynamic> json) => Record(
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
