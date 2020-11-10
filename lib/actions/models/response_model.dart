class ResponseModel<T> {
  final int code;
  final String msg;
  final bool success;
  final T result;
  ResponseModel({this.code, this.msg, this.success, this.result});
}
