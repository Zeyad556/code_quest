import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {  //<mmkn ady ay type>
  CounterCubit()
    : super(CounterInitstate()); // pass the start point with constructor

  void increment() {
    emit(CounterUpdateState(state.count + 1));

  }
  void decrement() {
    emit(CounterUpdateState(state.count - 1));

  }
}
