import 'package:flutter/material.dart';
import 'package:flutter_journey/provider/counter_app.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterApp>();

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 250),
            Text("Counter ${counter.counter}"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    context.read<CounterApp>().increment();
                  },
                ),

                ElevatedButton(
                  onPressed: () => context.read<CounterApp>().decrement(),
                  child: Icon(Icons.chair),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
