import 'package:counter_app/old_bloc/counter_bloc.dart';
import 'package:counter_app/old_cubit/counter_cubic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'inc_dec_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterCubit = CounterCubit();
 

  @override
  Widget build(BuildContext context) {
    // final counter = counterCubit.state;
    //  final counterBloc = BlocProvider.of<CounterBloc>(context);
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>(
                // bloc: counterBloc,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const IncDecPage()));
          }
        },
        tooltip: 'Navigate',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
