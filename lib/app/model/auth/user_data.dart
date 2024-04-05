import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_data.g.dart';

UserData dataFromJson(String str) => UserData.fromJson(json.decode(str));

String dataToJson(UserData data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class UserData extends HiveObject {
  UserData({
    this.id,
    this.fullName,
    this.email,
    this.mobile,
    this.gender,
    this.profilePic,
    this.age,
    this.countryCode,
    this.walletBalance,
    this.subscription,
    this.joinReason,
    this.height,
    this.weight,
    this.bmi,
    this.referralCode,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    profilePic = json['profilePic'];
    age = json['age'];
    countryCode = json['countryCode'];
    walletBalance = json['walletBalance'];
    subscription = json['subscription'];
    joinReason = json['joinReason'];
    height = json['height'];
    weight = json['weight'];
    bmi = json['bmi'];
    referralCode = json['referralCode'];
  }

  @HiveField(0)
  num? id;
  @HiveField(1)
  String? fullName;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? mobile;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? profilePic;
  @HiveField(6)
  num? age;
  @HiveField(7)
  String? countryCode;
  @HiveField(8)
  dynamic walletBalance;
  @HiveField(9)
  dynamic subscription;
  @HiveField(10)
  String? joinReason;
  @HiveField(11)
  num? height;
  @HiveField(12)
  num? weight;
  @HiveField(13)
  num? bmi;
  @HiveField(14)
  String? referralCode;

  UserData copyWith({
    num? id,
    String? fullName,
    String? email,
    String? mobile,
    String? gender,
    String? profilePic,
    num? age,
    String? countryCode,
    dynamic walletBalance,
    dynamic subscription,
    String? joinReason,
    num? height,
    num? weight,
    num? bmi,
    String? referralCode,
  }) =>
      UserData(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        gender: gender ?? this.gender,
        profilePic: profilePic ?? this.profilePic,
        age: age ?? this.age,
        countryCode: countryCode ?? this.countryCode,
        walletBalance: walletBalance ?? this.walletBalance,
        subscription: subscription ?? this.subscription,
        joinReason: joinReason ?? this.joinReason,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        bmi: bmi ?? this.bmi,
        referralCode: referralCode ?? this.referralCode,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['mobile'] = mobile;
    map['gender'] = gender;
    map['profilePic'] = profilePic;
    map['age'] = age;
    map['countryCode'] = countryCode;
    map['walletBalance'] = walletBalance;
    map['subscription'] = subscription;
    map['joinReason'] = joinReason;
    map['height'] = height;
    map['weight'] = weight;
    map['bmi'] = bmi;
    map['referralCode'] = referralCode;
    return map;
  }
}
