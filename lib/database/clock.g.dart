// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClockAdapter extends TypeAdapter<Clock> {
  @override
  Clock read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clock()
      ..description = fields[0] as String
      ..duration = fields[1] as int
      ..increment = fields[2] as int
      ..movesToIncrement = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, Clock obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.increment)
      ..writeByte(3)
      ..write(obj.movesToIncrement);
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;
}
