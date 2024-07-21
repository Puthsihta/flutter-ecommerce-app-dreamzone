// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaginationResponse<T> {
  final int status;
  final String message;
  final List<T> data;
  final Meta meta;

  PaginationResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory PaginationResponse.fromMap(
      Map<String, dynamic> map, T Function(dynamic e) toElement) {
    return PaginationResponse<T>(
        status: map['status'] as int,
        message: map['message'] as String,
        data: (map['data'] as List<dynamic>).map(toElement).toList(),
        meta: Meta.fromMap(map['meta']));
  }
}

class Meta {
  final int page;
  final int size;
  final int total;

  Meta({
    required this.page,
    required this.size,
    required this.total,
  });

  Meta copyWith({
    int? page,
    int? size,
    int? total,
  }) {
    return Meta(
      page: page ?? this.page,
      size: size ?? this.size,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'size': size,
      'total': total,
    };
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      page: map['page'] as int,
      size: map['size'] as int,
      total: map['total'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meta.fromJson(String source) =>
      Meta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Meta(page: $page, size: $size, total: $total)';

  @override
  bool operator ==(covariant Meta other) {
    if (identical(this, other)) return true;

    return other.page == page && other.size == size && other.total == total;
  }

  @override
  int get hashCode => page.hashCode ^ size.hashCode ^ total.hashCode;
}
