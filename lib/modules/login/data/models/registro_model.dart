class RegisterUser {
  final String userId;

  final String email;

  RegisterUser({
    required this.userId,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      userId: map['user']['id'] as String,
      email: map['user']['email'] as String,
    );
  }
}
