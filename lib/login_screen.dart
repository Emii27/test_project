import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test_project/roaming_screen.dart';

import 'animal.dart';
import 'tile_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AudioPlayer player;

  var counter = 0;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const .symmetric(horizontal: 24.0, vertical: 128.0),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              'Welcome',
              textAlign: .center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 32.0),
            Row(
              spacing: 24.0,
              mainAxisAlignment: .center,
              children: List.generate(6, (index) {
                return Icon(
                  index < counter ? Icons.circle : Icons.circle_outlined,
                  color: Colors.black,
                );
              }),
            ),
            SizedBox(height: 128.0),
            Row(
              spacing: 8.0,
              mainAxisAlignment: .center,
              children: [
                TileButton(animal: .dog, onTap: () => _onAnimalButtonTap(.dog)),
                TileButton(animal: .cat, onTap: () => _onAnimalButtonTap(.cat)),
                TileButton(animal: .duck, onTap: () => _onAnimalButtonTap(.duck)),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              spacing: 8.0,
              mainAxisAlignment: .center,
              children: [
                TileButton(animal: .pig, onTap: () => _onAnimalButtonTap(.pig)),
                TileButton(animal: .cow, onTap: () => _onAnimalButtonTap(.cow)),
                TileButton(
                  animal: .rooster,
                  onTap: () => _onAnimalButtonTap(.rooster),
                ),
              ],
            ), SizedBox(height: 8.0),
            Row(
              spacing: 8.0,
              mainAxisAlignment: .center,
              children: [
                TileButton(animal: .horse, onTap: () => _onAnimalButtonTap(.horse)),
                TileButton(animal: .sheep, onTap: () => _onAnimalButtonTap(.sheep)),
                IconButton(
                  onPressed: _resetCounter,
                  icon: Icon(Icons.close),
                  iconSize: 96.0,
                ),
              ],
            ),
            SizedBox(height: 16.0),

            Spacer(),
            FilledButton(
              onPressed: _onLogin,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAnimalButtonTap(Animal animal) async {
    // Counter
    _incrementCounter();

    // Sound
    _playAnimalSound(animal.name);
  }
  
  void _onLogin() {
    // if(counter >= 6) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => RoamingScreen()));
    // }
    _resetCounter();
    
  }

  void _playAnimalSound(String animal) async {
    final index = Random().nextInt(2) + 1;

    await player.setAsset('assets/audio/$animal-$index.mp3');
    await player.play();
    await player.stop();
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      counter = 0;
    });
  }
}
