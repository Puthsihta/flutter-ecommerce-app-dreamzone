import 'dart:convert';

class LoginRequest {
  String phone;
  String password;
  LoginRequest({
    required this.phone,
    required this.password,
  });

  LoginRequest copyWith({
    String? phone,
    String? password,
  }) {
    return LoginRequest(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginRequest(phone: $phone, password: $password)';

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;

    return other.phone == phone && other.password == password;
  }

  @override
  int get hashCode => phone.hashCode ^ password.hashCode;
}
