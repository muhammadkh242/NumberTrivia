class BaseState<T> {
  bool isLoading;
  bool hasNoConnection;
  T? data;

  BaseState({
    this.isLoading = false,
    this.hasNoConnection = false,
    required this.data,
  });
}
