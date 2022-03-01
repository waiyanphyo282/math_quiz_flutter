import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var message = "";
  var score = 0;
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var shuffled;
  var selection;
  var answer;

  @override
  Widget build(BuildContext context) {
    shuffled = numbers..shuffle(Random());
    selection = shuffled.take(3).toList();
    answer = selection[Random().nextInt(selection.length)];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Math Quiz"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Please select $answer',
                style: const TextStyle(fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  if (answer == selection[0]) {
                    setState(() {
                      score += 10;
                      message = "Your answer is Correct";
                    });
                  } else {
                    setState(() {
                      message = "Your answer is Incorrect";
                    });
                  }
                },
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/${selection[0]}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (answer == selection[1]) {
                    setState(() {
                      score += 10;
                      message = "Your answer is Correct";
                    });
                  } else {
                    setState(() {
                      message = "Your answer is Incorrect";
                    });
                  }
                },
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/${selection[1]}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (answer == selection[2]) {
                    setState(() {
                      score += 10;
                      message = "Your answer is Correct";
                    });
                  } else {
                    setState(() {
                      message = "Your answer is Incorrect";
                    });
                  }
                },
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/${selection[2]}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(message),
              Text(
                'Score : $score',
              ),
              const SizedBox(
                height: 4.0,
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
