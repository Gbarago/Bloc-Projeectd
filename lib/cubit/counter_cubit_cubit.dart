import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterState> {
  CounterCubitCubit() : super(CounterState(counterValue: 0));
  void increment() {
    print(''' in block =====::: ${state.counterValue}''');

    emit(CounterState(counterValue: state.counterValue + 1));
  }

  void dencrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
