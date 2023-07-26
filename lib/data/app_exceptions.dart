// ignore_for_file: unused_field

class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;
  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimout extends AppExceptions {
  RequestTimout([String? message]) : super(message, "Request Time Out");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internal Server Error");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message);
}

class InvalidTokenException extends AppExceptions {
  InvalidTokenException([String? message]) : super(message);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error while communication");
}
