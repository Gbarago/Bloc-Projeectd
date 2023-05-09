import 'package:bloc_counter/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubitCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.wasIncreamented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'counter has be increamented to ${state.counterValue}'),
                duration: Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    // Perform undo logic here
                  },
                ),
              ),
            );
          } else if (state.wasIncreamented == false) {
            Scaffold.of(context).showBottomSheet((context) => Container(
                height: 70,
                color: Colors.amberAccent,
                child: Center(
                  child: Text(
                      'counter has be decremented to ${state.counterValue}'),
                )));
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubitCubit, CounterState>(
                    builder: (context, state) {
                  if (state.counterValue > 5) {
                    return Text(
                      'you havee exceded the number of trials ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                  if (state.counterValue < 5 && state.counterValue == 4) {
                    return Text(
                      'you have one more trial',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }

                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      hoverColor: Colors.orange,
                      onPressed: () {
                        BlocProvider.of<CounterCubitCubit>(context)
                            .dencrement();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubitCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
