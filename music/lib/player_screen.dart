import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Blinding Lights',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            SizedBox(height: 24),
            Center(
              child: const Text(
                'Blinding Lights',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            Center(child: const Text('The Weeknd')),

            const SizedBox(height: 24),

            Slider(value: 0.2, onChanged: (value) {}),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.skip_previous, size: 36),
                SizedBox(width: 24),
                Icon(Icons.play_circle, size: 64),
                SizedBox(width: 24),
                Icon(Icons.skip_next, size: 36),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
