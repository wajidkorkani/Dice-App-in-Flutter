import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart'; // Import for sound

void main() {
  runApp(const MyApp()); // Added const for better performance
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); // Added const constructor
  @override
  DicePageState createState() => DicePageState();
}

class DicePageState extends State<MyApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 3;
  bool isRolling = false;
  final AudioPlayer _audioPlayer = AudioPlayer(); // Sound player

  // Initialize AudioPlayer (optional, but good practice for preloading)
  @override
  void initState() {
    super.initState();
    // You might want to preload the sound for a smoother experience
    // _audioPlayer.setSource(AssetSource('Sounds/dice_roll.wav'));
  }

  // Dispose AudioPlayer when the widget is removed
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void rollDiceWithAnimation() async {
    // If already rolling, do nothing
    if (isRolling) {
      print("Already rolling, skipping new roll.");
      return;
    }

    // Set isRolling to true to prevent multiple clicks
    setState(() { // Wrap state changes in setState
      isRolling = true;
    });

    try {
      // Play the dice roll sound once
      // Ensure 'Sounds/dice_roll.wav' is correctly added to pubspec.yaml assets
      await _audioPlayer.play(AssetSource('Sounds/dice_roll.wav'));
      print("Dice roll sound played.");
    } catch (e) {
      print("Error playing sound: $e");
    }

    int rollCount = 0;
    // Use a variable to hold the timer reference for explicit cancellation
    Timer? animationTimer;

    animationTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        // Generate random numbers for the dice
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });

      rollCount++;
      // Stop the animation after 10 iterations (1 second total)
      if (rollCount >= 10) {
        timer.cancel(); // Cancel the periodic timer
        animationTimer?.cancel(); // Ensure the timer reference is also cancelled

        setState(() {
          // Set final dice numbers after the animation
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
          isRolling = false; // Set isRolling to false after animation ends
          print("Dice roll animation finished.");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center( // Added const
            child: Text(
              "Dicee",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding( // Added Padding for better visual spacing
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton( // Changed to TextButton for a more typical button behavior
                    onPressed: rollDiceWithAnimation,
                    child: Image.asset(
                      "Images/dice$leftDiceNumber.png",
                      // Added an error builder for debugging image loading issues
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, size: 100, color: Colors.white);
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding( // Added Padding for better visual spacing
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton( // Changed to TextButton
                    onPressed: rollDiceWithAnimation,
                    child: Image.asset(
                      "Images/dice$rightDiceNumber.png",
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, size: 100, color: Colors.white);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}