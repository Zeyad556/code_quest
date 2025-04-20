part of 'counter_cubit.dart';

sealed class CounterState{
final int count;

  CounterState(this.count);
}

class CounterInitstate extends CounterState{
  CounterInitstate():super(0); //start point
}

class CounterUpdateState extends CounterState{
  CounterUpdateState(super.count);

}
