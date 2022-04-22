class AppError {
  final AppErrorType errorType;
  final String message;

  const AppError({required this.errorType, required this.message});
}

enum AppErrorType { api, network }