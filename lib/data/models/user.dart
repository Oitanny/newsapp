class User {
  final String username;
  final String email;
  final String password;
  final List<String> newsPreferences;
  final String avatarPic;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.newsPreferences,
    required this.avatarPic,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      newsPreferences: List<String>.from(json['newsPreferences']),
      avatarPic: json['avatarPic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'newsPreferences': newsPreferences,
      'avatarPic': avatarPic,
    };
  }
}
