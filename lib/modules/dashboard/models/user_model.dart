import 'dart:convert';

class UserModel {
  String id;
  String userName;
  String profilePic;
  String emailId;
  UserModel({
    required this.id,
    required this.userName,
    required this.profilePic,
    required this.emailId,
  });

  UserModel copyWith({
    String? id,
    String? userName,
    String? profilePic,
    String? emailId,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      profilePic: profilePic ?? this.profilePic,
      emailId: emailId ?? this.emailId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userName': userName});
    result.addAll({'profilePic': profilePic});
    result.addAll({'emailId': emailId});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      profilePic: map['profilePic'] ?? '',
      emailId: map['emailId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $userName, profilePic: $profilePic, emailId: $emailId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.userName == userName &&
        other.profilePic == profilePic &&
        other.emailId == emailId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        profilePic.hashCode ^
        emailId.hashCode;
  }
}
