import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 1)
class User {
  User({required this.name, required this.email, required this.profilePic});

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String profilePic;
}
