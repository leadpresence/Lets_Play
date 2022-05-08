// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      avatar: fields[14] as String?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      mobile: fields[3] as String?,
      autoUsername: fields[10] as String?,
      rewardPoints: fields[19] as int?,
      role: fields[5] as String?,
      wins: fields[13] as int?,
      country: fields[17] as String?,
      inviteLink: fields[18] as String?,
      gender: fields[8] as String?,
      address: fields[9] as String?,
      emailVerified: fields[15] as bool?,
      phoneVerified: fields[11] as bool?,
      status: fields[12] as String?,
      createdAt: fields[16] as DateTime?,
      token: fields[6] as String?,
    )
      ..email = fields[4] as String
      ..password = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.mobile)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.token)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.autoUsername)
      ..writeByte(11)
      ..write(obj.phoneVerified)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.avatar)
      ..writeByte(15)
      ..write(obj.emailVerified)
      ..writeByte(13)
      ..write(obj.wins)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.country)
      ..writeByte(18)
      ..write(obj.inviteLink)
      ..writeByte(19)
      ..write(obj.rewardPoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
