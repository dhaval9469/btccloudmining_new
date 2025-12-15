import 'package:hive/hive.dart';

part 'active_bot_model.g.dart';

@HiveType(typeId: 0)
class ActiveBotModel extends HiveObject {
  @HiveField(0)
  String productID;

  @HiveField(1)
  String botType;

  @HiveField(2)
  String type;

  @HiveField(3)
  String power;

  @HiveField(4)
  String machineType;

  @HiveField(5)
  int duration;

  @HiveField(6)
  int addTime;

  @HiveField(7)
  int expireTime;

  @HiveField(8)
  int? days;

  ActiveBotModel({
    required this.productID,
    required this.botType,
    required this.type,
    required this.power,
    required this.machineType,
    required this.duration,
    required this.addTime,
    required this.expireTime,
    this.days,
  });
}
