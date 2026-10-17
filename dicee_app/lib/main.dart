import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceeApp());
}

class DiceeApp extends StatelessWidget {
  const DiceeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // Initial dice values
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // Function to change the dice numbers
  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // Generates a number between 1 and 6
      rightDiceNumber = Random().nextInt(6) + 1; // Generates a number between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Dicee'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Row to hold two dice images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Left Dice Image
                Image.asset(
                  'images/dice$leftDiceNumber.png',
                  height: 150.0,
                  width: 150.0,
                ),
                // Right Dice Image
                Image.asset(
                  'images/dice$rightDiceNumber.png',
                  height: 150.0,
                  width: 150.0,
                ),
              ],
            ),
            // Button to roll the dice
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Correct way to set color
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Roll Dice'),
            )
          ],
        ),
      ),
    );
  }
}
