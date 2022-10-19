class BaseState<T> {
  bool isLoading;
  T? data;

  BaseState({
    this.isLoading = false,
    required this.data,
  });

  BaseState<T> copyWith({
    bool? isLoading,
    bool? hasNoConnection,
    T? data,
  }) {
    return BaseState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
