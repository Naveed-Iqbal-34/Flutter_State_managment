import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state_management/counter_provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('State Management'),
      ),

      body: Center(
        child: Consumer(builder: (ctx,_,__){
          return RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight(800),
                fontSize: 20,
              ),
              children: [
                TextSpan(text: 'You pressed the Button\n'),
                TextSpan(
                  text: '${Provider.of<CounterProvider>(ctx).getCount()}',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 50,
                    height: 1.3,
                  ),
                ),
                TextSpan(text: '  times.'),
              ],
            ),
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterProvider>(context, listen: false).incrementCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
