// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dreamzone/data/models/user.dart';

class Token {
  final String token;
  final String refresh_token;
  final User user;

  Token({
    required this.token,
    required this.refresh_token,
    required this.user,
  });

  Token copyWith({
    String? token,
    String? refresh_token,
    User? user,
  }) {
    return Token(
      token: token ?? this.token,
      refresh_token: refresh_token ?? this.refresh_token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'refresh_token': refresh_token,
      'user': user.toMap(),
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      token: map['token'] as String,
      refresh_token: map['refresh_token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Token(token: $token, refresh_token: $refresh_token, user: $user)';

  @override
  bool operator ==(covariant Token other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.refresh_token == refresh_token &&
        other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ refresh_token.hashCode ^ user.hashCode;
}
