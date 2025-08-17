import 'package:countrylens/src/config/config_export.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class ApiResponse<T> {
  const ApiResponse();

  R when<R>({
    required R Function(Successful<T> _) successful,
    required R Function(Unsuccessful<T> _) unSuccessful,
  });
}

class Successful<T> extends ApiResponse<T> {
  
  Successful({this.data});
  final T? data;

  @override
  R when<R>({
    required R Function(Successful<T> _) successful,
    required R Function(Unsuccessful<T> _) unSuccessful
  }) => successful(this);
}

class Unsuccessful<T> extends ApiResponse<T> {
  Unsuccessful({required this.error});
  final CLException error;

  @override
  R when<R>({
    required R Function(Successful<T> _) successful,
    required R Function(Unsuccessful<T> _) unSuccessful
  }) => unSuccessful(this);
}



class CLException implements Exception {
  CLException(dynamic error, [StackTrace? stack])
    : _rawError = error, _stackTrace = stack;

  final dynamic _rawError;
  final StackTrace? _stackTrace;
  
  StackTrace? get stackTrace => _stackTrace;

  String get errorMsg {
    if (_rawError == null) return CLStrings.ERROR_OCCURRED;

    if (_rawError is OperationException) {
      final linkException = _rawError.linkException;
      final graphqlErrors = _rawError.graphqlErrors;

      if (linkException != null) {
        return CLStrings.NO_INTERNET;
      }

      if (graphqlErrors.isNotEmpty) {
        return graphqlErrors.map((e) => e.message).join(', ');
      }

      return 'GraphQL error: ${_rawError.toString()}';
    }

    return _rawError.toString();
  }

  @override
  String toString() => errorMsg;
}

