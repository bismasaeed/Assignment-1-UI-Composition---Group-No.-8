import 'package:flutter/material.dart';

void main() {
  runApp(BackdropsApp());
}

class BackdropsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExploreScreen(),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  final List<Map<String, String>> wallpapers = [
    {
      'title': 'Prosperity',
      'imageUrl':
      'https://images.unsplash.com/photo-1741606552241-fbd67e574f7f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8',
    },
    {
      'title': 'Jagged Edge',
      'imageUrl':
      'https://plus.unsplash.com/premium_photo-1722169898897-b887c5548223?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
    },
    {
      'title': 'Pushing Pixels',
      'imageUrl':
      'https://images.unsplash.com/photo-1741851374655-3911c1b0e95a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2fHx8ZW58MHx8fHx8',
    },
    {
      'title': 'Sublime Shine',
      'imageUrl':
      'https://images.unsplash.com/photo-1742201877377-03d18a323c18?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMXx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Vibrant Blocks',
      'imageUrl':
      'https://plus.unsplash.com/premium_photo-1726822827200-607b798be34e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Nature Blend',
      'imageUrl':
      'https://plus.unsplash.com/premium_photo-1676977395508-9eec938ef7ee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxN3x8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110), // increased height to fit both AppBar and icons row
        child: Column(
          children: [
            // Top AppBar with Menu + Title + Search
            AppBar(
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.white), // Menu Icon
                  Text(
                    'EXPLORE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Icon(Icons.search, color: Colors.white), // Search Icon
                ],
              ),
            ),

            // Row of 4 icons under the title
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.public, color: Colors.white), // World Icon
                  Icon(Icons.trending_up, color: Colors.white), // Trend Icon
                  Icon(Icons.change_history, color: Colors.white), // Triangle Icon
                  Icon(Icons.favorite_border, color: Colors.white), // Favorite Icon
                ],
              ),
            ),
          ],
        ),
      ),

        body: Column(
          children: [
            // Wall of the Day (Transparent Background)
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://source.unsplash.com/random/600x400?wallpaper'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),  // Set transparency here
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'WALL OF THE DAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),

            SizedBox(height: 16),

            // Grid of wallpapers
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  itemCount: wallpapers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return WallpaperCard(
                      title: wallpapers[index]['title']!,
                      imageUrl: wallpapers[index]['imageUrl']!,
                    );
                  },
                ),
              ),
            ),
          ],
        )

    );
  }
}

class WallpaperCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const WallpaperCard({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kxnt',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white70,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
