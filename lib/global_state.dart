import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class GlobalState extends StatelessWidget {
  const GlobalState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State management'),
      backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white
          ),
          onPressed: () {
            context.read<CounterProvider>().incrementCount();
          },
          child: Icon(Icons.add, size: 30,),
        ),
      ),
    );
  }
}
