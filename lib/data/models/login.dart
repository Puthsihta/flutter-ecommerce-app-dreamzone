import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Login {
  int? code;
  Login({
    this.code,
  });

  Login copyWith({
    int? code,
  }) {
    return Login(
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      code: map['code'] != null ? map['code'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) =>
      Login.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Login(code: $code)';

  @override
  bool operator ==(covariant Login other) {
    if (identical(this, other)) return true;

    return other.code == code;
  }

  @override
  int get hashCode => code.hashCode;
}
