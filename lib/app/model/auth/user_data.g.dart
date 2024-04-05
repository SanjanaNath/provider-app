// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 1;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return UserData(
      id: fields[0] as num?,
      fullName: fields[1] as String?,
      email: fields[2] as String?,
      mobile: fields[3] as String?,
      gender: fields[4] as String?,
      profilePic: fields[5] as String?,
      age: fields[6] as num?,
      countryCode: fields[7] as String?,
      walletBalance: fields[8] as dynamic,
      subscription: fields[9] as dynamic,
      joinReason: fields[10] as String?,
      height: fields[11] as num?,
      weight: fields[12] as num?,
      bmi: fields[13] as num?,
      referralCode: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.mobile)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.profilePic)
      ..writeByte(6)
      ..write(obj.age)
      ..writeByte(7)
      ..write(obj.countryCode)
      ..writeByte(8)
      ..write(obj.walletBalance)
      ..writeByte(9)
      ..write(obj.subscription)
      ..writeByte(10)
      ..write(obj.joinReason)
      ..writeByte(11)
      ..write(obj.height)
      ..writeByte(12)
      ..write(obj.weight)
      ..writeByte(13)
      ..write(obj.bmi)
      ..writeByte(14)
      ..write(obj.referralCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserDataAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
