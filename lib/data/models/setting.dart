import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Setting {
  String? title;
  String? content;
  Setting({
    this.title,
    this.content,
  });

  Setting copyWith({
    String? title,
    String? content,
  }) {
    return Setting(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory Setting.fromMap(Map<String, dynamic> map) {
    return Setting(
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Setting.fromJson(String source) =>
      Setting.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Setting(title: $title, content: $content)';

  @override
  bool operator ==(covariant Setting other) {
    if (identical(this, other)) return true;

    return other.title == title && other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
