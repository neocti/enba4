import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.deepOrange,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}
class _DicePageState extends State<DicePage> {
  int left = 1, right = 1, sum = 0, leftScore = 0, rightScore = 0;
  @override
  Widget build(BuildContext context) {
    sum = left + right;
    score();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,
                      horizontal: 16.0),
                  child: Text("Points: $leftScore", style: const TextStyle(
                    fontSize: 25.0,
                  ),)
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,
                    horizontal: 16.0),
                child: Text("Points: $rightScore", style: const TextStyle(
                    fontSize: 25.0
                )),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  )
              )),
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    }, child: Image.asset('images/dice$right.png'),
                  )
              )),
            ],
          ),
          Text("The total roll is $sum",
              style: const TextStyle(
                fontSize: 25.0,
              )),
          Text(getWinner(),
              style: const TextStyle(
                fontSize: 25.0,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal:
            0.0),
            child: FilledButton(onPressed: () {
              setState(() {
                left = 1;
                right = 1;
                leftScore = 0;
                rightScore = 0;
              });
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ), child: const Text(
                  "Reset"
              ),
            ),
          )
        ],
      ),
    );
  }
  void changeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
  }
  String getWinner() {
    if (left > right) {
      return "The Left dice rolls higher";
    } else if (right > left) {
      return "The Right dice rolls higher";
    } else {
      return "The Dice rolls are equal";
    }
  }
  void score() {
    if (left > right) {
      leftScore++;
    } else if (right > left) {
      rightScore++;
    }
  }
}


