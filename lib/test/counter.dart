import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      //aw create: (BuildContext context){return CounterCubit();}
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Counter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: Text(
                    'MINUS',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.count.toString(),
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: Text(
                    'PLUS',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
