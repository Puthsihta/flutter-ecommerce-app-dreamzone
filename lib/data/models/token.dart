// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dreamzone/data/models/user.dart';

class Token {
  final String token;
  final User user;

  Token({
    required this.token,
    required this.user,
  });

  Token copyWith({
    String? token,
    String? refresh_token,
    User? user,
  }) {
    return Token(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'user': user.toMap(),
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      token: map['token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Token(token: $token, user: $user)';

  @override
  bool operator ==(covariant Token other) {
    if (identical(this, other)) return true;

    return other.token == token && other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
