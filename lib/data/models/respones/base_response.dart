class BaseResponse<T> {
  final int status;
  final String message;
  final T data;

  BaseResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> map, T data) {
    return BaseResponse<T>(
      status: map['status'] as int,
      message: map['message'] as String,
      data: data,
    );
  }
}
