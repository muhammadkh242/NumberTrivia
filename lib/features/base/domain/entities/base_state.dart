class BaseState<T> {
  bool isLoading;
  T? data;

  BaseState({
    this.isLoading = false,
    required this.data,
  });
}
