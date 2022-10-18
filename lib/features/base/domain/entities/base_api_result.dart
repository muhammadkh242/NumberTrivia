import '../../../../common/api/api_methods.dart';

class BaseApiResult<T> {
  T? data;
  final String? successMessage;
  final String? errorMessage;
  final ErrorType? errorType;

  BaseApiResult({
    this.data,
    this.successMessage,
    this.errorMessage,
    this.errorType,
  });
}
