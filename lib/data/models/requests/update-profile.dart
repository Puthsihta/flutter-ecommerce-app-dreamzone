import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RequestUpdateProfile {
  String name;
  String? email;
  String? image_url;
  RequestUpdateProfile({
    required this.name,
    this.email,
    this.image_url,
  });

  RequestUpdateProfile copyWith({
    String? name,
    String? email,
    String? image_url,
  }) {
    return RequestUpdateProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      image_url: image_url ?? this.image_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'image_url': image_url,
    };
  }

  factory RequestUpdateProfile.fromMap(Map<String, dynamic> map) {
    return RequestUpdateProfile(
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestUpdateProfile.fromJson(String source) =>
      RequestUpdateProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RequestUpdateProfile(name: $name, email: $email, image_url: $image_url)';

  @override
  bool operator ==(covariant RequestUpdateProfile other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.image_url == image_url;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ image_url.hashCode;
}
