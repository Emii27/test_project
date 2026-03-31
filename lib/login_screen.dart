import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'TileButton.dart';

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
                TileButton(animal: .dog, onTap: () => _onButtonTap(.dog)),
                TileButton(animal: .cat, onTap: () => _onButtonTap(.cat)),
                TileButton(animal: .duck, onTap: () => _onButtonTap(.duck)),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              spacing: 8.0,
              mainAxisAlignment: .center,
              children: [
                TileButton(animal: .pig, onTap: () => _onButtonTap(.pig)),
                TileButton(animal: .cow, onTap: () => _onButtonTap(.cow)),
                TileButton(
                  animal: .rooster,
                  onTap: () => _onButtonTap(.rooster),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            IconButton(
              onPressed: _resetCounter,
              icon: Icon(Icons.close),
              iconSize: 48.0,
            ),
            Spacer(),
            FilledButton(
              onPressed: _resetCounter,
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

  void _onButtonTap(Animal animal) async {
    _incrementCounter();

    await player.setAsset('assets/audio/${animal.name}.mp3');
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
