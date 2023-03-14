import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();
  int x = 4;
  int y = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Lottery App')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Lottery winning number is $x',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: y == x
                      ? Colors.teal.withOpacity(.3)
                      : Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: y == x
                      ? Column(
                          children: [
                            const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Yay!!! You won the Lottery! Have fun!\nYour number is $y',
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Better Luck next time, your number is: $y\nTry again',
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            y = random.nextInt(10);
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
