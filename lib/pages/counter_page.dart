import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  var counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter < 1) {
        final snackBar = SnackBar(
          content: const Text('Terus we dikurangan!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        counter--;
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Perulangan ke : '),
          Text(
            '$counter',
            style: TextStyle(
              fontSize: counter.toDouble(),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  incrementCounter();
                },
                child: Icon(Icons.add),
              ),
              ElevatedButton(
                onPressed: () {
                  decrementCounter();
                },
                child: Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
