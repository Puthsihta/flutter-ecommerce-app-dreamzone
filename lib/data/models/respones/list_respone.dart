// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListRespone<T> {
  final bool message;
  final List<T> data;

  ListRespone({
    required this.message,
    required this.data,
  });

  factory ListRespone.fromMap(
      Map<String, dynamic> map, T Function(dynamic e) toElement) {
    return ListRespone<T>(
      message: map['message'] as bool,
      data: (map['data'] as List<dynamic>).map(toElement).toList(),
    );
  }
}
