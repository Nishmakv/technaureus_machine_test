import 'dart:convert';

enum Status { loading, completed, error }

class BaseResponse {
  String? message;
  int? errorCode;
  dynamic data;

  BaseResponse({
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromJson(source) => BaseResponse.fromMap(source);
}
