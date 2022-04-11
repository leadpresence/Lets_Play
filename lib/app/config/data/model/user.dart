import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../utils/type_id.dart';

part 'user.g.dart';

@HiveType(typeId: TypeId.user, adapterName: 'UserAdapter')
class User extends Equatable {
  @HiveField(0)
  int id = -1;
  String? avatar = "";
  @HiveField(1)
  String? firstName = "";
  @HiveField(2)
  String? lastName = "";
  @HiveField(3)
  String? phone = "";
  @HiveField(4)
  String email = "";
  @HiveField(5)
  String? role = "";
  @HiveField(6)
  String? token = "";
  @HiveField(7)
  String? password = "";
  @HiveField(8)
  String? gender = "";
  @HiveField(9)
  String? address = "";
  @HiveField(10)
  String? emailVerifiedAt = "";
  @HiveField(11)
  String? phoneVerified = "";
  @HiveField(12)
  String? status = "";
  @HiveField(13)
  String? createdAt = "";
  @HiveField(14)
  String? updatedAt = "";
  bool emailVerified = false;

  User({
     this.id=-1,
    this.avatar,
    this.firstName,
    this.lastName,
    this.phone,
    this.role,
    this.gender,
    this.address,
    this.emailVerifiedAt,
    this.emailVerified = false,
    this.phoneVerified,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['avatar'] = avatar;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['gender'] = gender;
    data['role'] = role;
    data['address'] = address;
    data['email_verified_at'] = emailVerifiedAt;
    data['email_verified'] = emailVerified;
    data['phone_verified'] = phoneVerified;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  List<Object> get props => [id, email];
}
