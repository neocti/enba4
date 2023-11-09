import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
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
  int left = 1, right = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      ChangeValue();
                    });
                  },
                  child: Image.asset('images/dice$left.png')),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                     ChangeValue();
                    });

                  },
                  child: Image.asset('images/dice$right.png')),
            )),
          ],
        ));
  }
    void ChangeValue(){
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);
    }
  }



