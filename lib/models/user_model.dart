class UserData {
  final int id;
  final String name;
  final String email;
  final String profile_image;

  UserData(
      {required this.id,
        required this.name,
        required this.email,
        required this.profile_image});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id']??'',
      name: json['name']??'',
      email: json['email']??'hi',
      profile_image: json['profile_image']??'hi',
    );
  }
}