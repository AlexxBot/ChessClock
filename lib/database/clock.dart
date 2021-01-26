import 'package:hive/hive.dart';

part 'clock.g.dart';

@HiveType()
class Clock extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  int duration;

  @HiveField(2)
  //List<String> friends;
  int increment;

  @HiveField(3)
  int movesToIncrement;

  /* @override
  String toString() {
    return '$name: $age';
  } */
}
