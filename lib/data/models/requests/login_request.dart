import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequest {
  String phone;
  bool is_debug;
  LoginRequest({
    required this.phone,
    required this.is_debug,
  });

  LoginRequest copyWith({
    String? phone,
    bool? is_debug,
  }) {
    return LoginRequest(
      phone: phone ?? this.phone,
      is_debug: is_debug ?? this.is_debug,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'is_debug': is_debug,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      phone: map['phone'] as String,
      is_debug: map['is_debug'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginRequest(phone: $phone, is_debug: $is_debug)';

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;

    return other.phone == phone && other.is_debug == is_debug;
  }

  @override
  int get hashCode => phone.hashCode ^ is_debug.hashCode;
}

class VerifyOtpRequest {
  String phone;
  String otp;
  VerifyOtpRequest({
    required this.phone,
    required this.otp,
  });

  VerifyOtpRequest copyWith({
    String? phone,
    String? otp,
  }) {
    return VerifyOtpRequest(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'otp': otp,
    };
  }

  factory VerifyOtpRequest.fromMap(Map<String, dynamic> map) {
    return VerifyOtpRequest(
      phone: map['phone'] as String,
      otp: map['otp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpRequest.fromJson(String source) =>
      VerifyOtpRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerifyOtpRequest(phone: $phone, otp: $otp)';

  @override
  bool operator ==(covariant VerifyOtpRequest other) {
    if (identical(this, other)) return true;

    return other.phone == phone && other.otp == otp;
  }

  @override
  int get hashCode => phone.hashCode ^ otp.hashCode;
}
