class LoginUser {
  final String acessToken;
  final String userId;
  final String email;

  LoginUser({
    required this.acessToken,
    required this.userId,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'acess_token': acessToken
    };
  }

  factory LoginUser.fromMap(Map<String, dynamic> map) {
    return LoginUser(
      acessToken: map['access_token'],
      userId: map['user']['id'] as String,
      email: map['user']['email'] as String,
    );
  }
}
