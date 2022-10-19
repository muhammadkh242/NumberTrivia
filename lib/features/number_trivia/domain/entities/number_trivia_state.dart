import 'package:nums/features/base/domain/entities/base_state.dart';

class NumberTriviaState<T> extends BaseState<T> {
  bool emptyNumber;
  bool invalidNumber;

  NumberTriviaState(
      {this.emptyNumber = false,
      this.invalidNumber = false,
      super.isLoading,
      required super.data})
      : super();

  NumberTriviaState<T> copyWith({
    bool? emptyNumber,
    bool? invalidNumber,
    T? data,
    bool? isLoading,
  }) {
    return NumberTriviaState(
      data: data ?? this.data,
      isLoading: isLoading ?? super.isLoading,
      emptyNumber: emptyNumber ?? this.emptyNumber,
      invalidNumber: invalidNumber ?? this.invalidNumber,
    );
  }
}
