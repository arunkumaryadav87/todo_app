// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoAdapter extends TypeAdapter<ToDo> {
  @override
  final int typeId = 2;

  @override
  ToDo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDo(
      userId: fields[0] as int?,
      title: fields[1] as String?,
      id: fields[2] as int?,
      completed: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ToDo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
