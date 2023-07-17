class User {
  final String uid;
  final String username;
  final String email;

  User({this.uid, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
      };

  @override
  String toString() {
    return 'User{uid: $uid, username: $username, email: $email}';
  }
}
