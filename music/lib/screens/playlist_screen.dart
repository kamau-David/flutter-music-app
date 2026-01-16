import 'package:flutter/material.dart';
import 'player_screen.dart';

class PlaylistScreen extends StatelessWidget {
  final String playlistName;

  const PlaylistScreen({super.key, required this.playlistName});

  @override
  Widget build(BuildContext context) {
    // Songs for this playlist
    final Map<String, List<String>> playlistSongs = {
      'Chill Hits': ['Song A', 'Song B', 'Song C'],
      'Workout Mix': ['Song D', 'Song E', 'Song F'],
      'Top 50': ['Song G', 'Song H', 'Song I'],
      'Focus Music': ['Song J', 'Song K', 'Song L'],
    };

    final songs = playlistSongs[playlistName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(playlistName), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return GestureDetector(
            onTap: () {
              // Navigate to PlayerScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlayerScreen(songTitle: song),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.deepPurpleAccent,
              ),
              child: Row(
                children: [
                  const Icon(Icons.music_note, size: 32),
                  const SizedBox(width: 16),
                  Text(song, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
