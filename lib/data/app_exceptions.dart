class AppException implements Exception {
  final _prefix;
  final _message;

  AppException([this._prefix, this._message]);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, ' Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, '');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, ' Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, ' Invalid Input');
}

class ServerException extends AppException {
  ServerException([String? message])
      : super(message, ' Server Error. Please try again later.');
}
