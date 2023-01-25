class User {
  final int? id;
  final String userName;
  final String email;
  final String password;

  User({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      userName: map['userName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
