abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class ServerException extends AppException {
  ServerException(String message) : super(message);
}

class NoInternetException extends AppException {
  NoInternetException(String message) : super(message);
}
