import 'package:flutter/material.dart';
import 'package:music/player_screen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chill Hits'), centerTitle: true),

      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blueGrey),
            title: const Text('Blinding Lights'),
            subtitle: const Text('The Weeknd'),
            trailing: const Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PlayerScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
