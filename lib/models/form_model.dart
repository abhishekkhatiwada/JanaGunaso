import 'package:gunaso/models/user_model.dart';

class GunasoData {
  final int id;
  final String title;
  final String description;
  final String user_name;
  final UserData userData;

  GunasoData(
      {required this.id,
      required this.title,
      required this.description,
      required this.user_name,
      required this.userData
      });

  factory GunasoData.fromJson(Map<String, dynamic> json) {
    return GunasoData(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      user_name: json['user_name'],
      userData: UserData.fromJson(json['user']),
    );
  }
}