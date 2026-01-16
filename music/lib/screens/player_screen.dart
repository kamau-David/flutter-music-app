import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  final String songTitle;

  const PlayerScreen({super.key, required this.songTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(songTitle), centerTitle: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Album Art Placeholder
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: const Icon(Icons.music_note, size: 100),
              ),

              const SizedBox(height: 32),

              // Song Title
              Text(
                songTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // Artist (placeholder)
              const Text(
                'Unknown Artist',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 32),

              // Slider
              Slider(value: 0.3, onChanged: (value) {}),

              // Time indicators
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('1:10'), Text('3:45')],
              ),

              const SizedBox(height: 32),

              // Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.skip_previous, size: 36),
                  Icon(Icons.play_circle_fill, size: 64),
                  Icon(Icons.skip_next, size: 36),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
