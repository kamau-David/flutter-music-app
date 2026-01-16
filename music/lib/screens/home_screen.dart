import 'package:flutter/material.dart';
import 'player_screen.dart';
import 'playlist_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> recentSongs = [
    {'title': 'Blinding Lights'},
    {'title': 'Starboy'},
    {'title': 'Save Your Tears'},
  ];

  final List<Map<String, String>> playlists = [
    {'name': 'Chill Hits'},
    {'name': 'Workout Mix'},
    {'name': 'Top 50'},
    {'name': 'Focus Music'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello, Alex')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              SizedBox(height: 10),
              // ---------------- Recently Played (ROW) ----------------
              const Text(
                'Recently Played',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recentSongs.length,
                  itemBuilder: (context, index) {
                    return _recentCard(context, recentSongs[index]['title']!);
                  },
                ),
              ),

              const SizedBox(height: 24),

              // ---------------- Playlists (COLUMN) ----------------
              const Text(
                'Playlists',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  return _playlistItem(context, playlists[index]['name']!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Widgets ----------------

  Widget _recentCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PlayerScreen(songTitle: title)),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.deepPurple,
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _playlistItem(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlaylistScreen(playlistName: title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(_getPlaylistImage(title)),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.music_note, size: 32),
            const SizedBox(width: 16),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

String _getPlaylistImage(String playlistName) {
  switch (playlistName) {
    case 'Chill Hits':
      return 'assets/chill_hits.jpg';
    case 'Workout Mix':
      return 'assets/workout_mix.jpg';
    case 'Top 50':
      return 'assets/top_50.jpg';
    case 'Focus Music':
      return 'assets/focus_music.jpg';
    default:
      return 'assets/chill_hits.jpg';
  }
}
