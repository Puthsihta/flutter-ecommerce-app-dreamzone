class BaseResponse<T> {
  final bool message;
  final T data;

  BaseResponse({
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> map, T data) {
    return BaseResponse<T>(
      message: map['message'] as bool,
      data: data,
    );
  }
}
