import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:state_management/counter_provider.dart';
import 'package:state_management/global_state.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>CounterProvider(),
      child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      home: HomePage(),
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
                  text: '${ctx.watch<CounterProvider>().getCount()}',
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
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return GlobalState();
          }));
        },
        child: Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
