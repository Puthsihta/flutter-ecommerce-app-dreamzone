import 'dart:convert';

class PaginationResponse<T> {
  final bool message;
  final List<T> data;
  final Pagination pagination;

  PaginationResponse({
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory PaginationResponse.fromMap(
      Map<String, dynamic> map, T Function(dynamic e) toElement) {
    return PaginationResponse<T>(
        message: map['message'] as bool,
        data: (map['data'] as List<dynamic>).map(toElement).toList(),
        pagination: Pagination.fromMap(map['pagination']));
  }
}

class Pagination {
  final int? limit;
  final int? total;
  final int? currentPage;
  final int? totalPages;

  Pagination({
    this.limit,
    this.total,
    this.currentPage,
    this.totalPages,
  });

  Pagination copyWith({
    int? limit,
    int? total,
    int? currentPage,
    int? totalPages,
  }) {
    return Pagination(
      limit: limit ?? this.limit,
      total: total ?? this.total,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'limit': limit,
      'total': total,
      'currentPage': currentPage,
      'totalPages': totalPages,
    };
  }

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      limit: map['limit'] != null ? map['limit'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      currentPage:
          map['currentPage'] != null ? map['currentPage'] as int : null,
      totalPages: map['totalPages'] != null ? map['totalPages'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagination.fromJson(String source) =>
      Pagination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pagination(limit: $limit, total: $total, currentPage: $currentPage, totalPages: $totalPages)';
  }

  @override
  bool operator ==(covariant Pagination other) {
    if (identical(this, other)) return true;

    return other.limit == limit &&
        other.total == total &&
        other.currentPage == currentPage &&
        other.totalPages == totalPages;
  }

  @override
  int get hashCode {
    return limit.hashCode ^
        total.hashCode ^
        currentPage.hashCode ^
        totalPages.hashCode;
  }
}
