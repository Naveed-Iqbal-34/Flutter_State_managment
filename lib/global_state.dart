import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class GlobalState extends StatelessWidget {
  const GlobalState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State management')),
      body: ElevatedButton(
        onPressed: () {
          context.read<CounterProvider>().incrementCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
