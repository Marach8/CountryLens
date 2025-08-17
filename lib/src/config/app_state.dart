sealed class CLAppState<T> {
  const CLAppState();

  factory CLAppState.initialState() = InitialState<T>;
  factory CLAppState.loadingState() = LoadingState<T>;
  factory CLAppState.successState(T data, {String message}) = SuccessState<T>;
  factory CLAppState.failureState(String? message, {T oldData}) = FailureState<T>;
}

class InitialState<T> extends CLAppState<T> {
  const InitialState();
}

class LoadingState<T> extends CLAppState<T> {
  const LoadingState();
}

class SuccessState<T> extends CLAppState<T> {
  const SuccessState(this.data, {this.message});
  final T data;
  final String? message;
  
}

class FailureState<T> extends CLAppState<T> {
  const FailureState(this.message, {this.oldData});
  final String? message;
  final T? oldData;
}
