import 'package:dio/dio.dart';
import 'package:nums/common/api/api_config.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';

import '../../features/base/domain/entities/base_api_result.dart';

class ApiMethods<T> {
  Future<BaseApiResult<T>> get(String url, Map<String, String>? params) async {
    try {
      Response response = await ApiConfig.dio.get(url, queryParameters: params);
      return _handleResponse(response);
    } on DioError catch (error) {
      return _catchError(error);
    }
  }

  BaseApiResult<T> _handleResponse(Response response) {
    final responseData = response.data;
    if (responseData == null) {
      return BaseApiResult<T>(errorType: ErrorType.generalError);
    }
    return BaseApiResult<T>(
        data: _dataFromJson<T>(responseData), successMessage: "success");
  }

  R? _dataFromJson<R>(dynamic data) {
    if (R == NumberTrivia) {
      return NumberTrivia.fromJson(data) as R;
    }
    return null;
  }

  BaseApiResult<E> _catchError<E>(DioError dioError) {
    if (dioError.type == DioErrorType.response) {
      return _handleApiErrors(dioError);
    } else {
      return _handleDioErrors(dioError);
    }
  }

  BaseApiResult<E> _handleApiErrors<E>(DioError dioError) {
    if (dioError.response?.data == null) {
      return BaseApiResult<E>(errorType: ErrorType.generalError);
    }
    switch (dioError.response?.statusCode) {
      case UNAUTHORIZED_ERROR:
        return BaseApiResult<E>(
            errorType: ErrorType.notAuthorized, errorMessage: "Not Authorized");
      case SERVER_ERROR:
        return BaseApiResult<E>(errorType: ErrorType.generalError);
      default:
        return BaseApiResult<E>(errorType: ErrorType.generalError);
    }
  }

  BaseApiResult<E> _handleDioErrors<E>(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return BaseApiResult<E>(errorType: ErrorType.noNetworkError);
      case DioErrorType.sendTimeout:
        return BaseApiResult<E>(errorType: ErrorType.noNetworkError);
      case DioErrorType.receiveTimeout:
        return BaseApiResult<E>(errorType: ErrorType.noNetworkError);
      case DioErrorType.response:
        return BaseApiResult<E>(errorType: ErrorType.generalError);
      case DioErrorType.cancel:
        return BaseApiResult<E>(errorType: ErrorType.cancelledError);
      case DioErrorType.other:
        return BaseApiResult<E>(errorType: ErrorType.generalError);
    }
  }
}

const int SUCCESS = 200;
const int UNAUTHORIZED_ERROR = 401;
const int NOT_FOUND = 404;
const int SERVER_ERROR = 500;

enum ErrorType {
  noNetworkError,
  noDataError,
  cancelledError,
  generalError,
  notAuthorized,
}
