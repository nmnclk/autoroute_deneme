part of 'counter_cubit.dart';

@immutable
class CounterState extends Equatable {
  const CounterState({required this.isLogin, required this.counter});
  final int counter;
  final bool isLogin;

  @override
  List<Object?> get props => [counter, isLogin];

  CounterState copyWith({int? counter, bool? isLogin}) {
    return CounterState(
      counter: counter ?? this.counter,
      isLogin: isLogin ?? this.isLogin,
    );
  }
}
