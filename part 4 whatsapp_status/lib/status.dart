import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatusScreen(),
    );
  }
}

class StatusScreen extends StatelessWidget {
  final List<Map<String, String>> recentStatuses = [
    {
      'name': 'Aisha Saeed',
      'time': 'Today, 11:57 AM',
      'image':
      'https://plus.unsplash.com/premium_photo-1675263779289-149156f7cc1c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMXx8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  final List<Map<String, String>> viewedStatuses = [
    {
      'name': 'Rameen Ahmed',
      'time': '4 minutes ago',
      'image':
      'https://plus.unsplash.com/premium_photo-1722169898897-b887c5548223?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
    },
    {
      'name': 'Mahnoor Faizan',
      'time': 'Today, 1:07 PM',
      'image':
      'https://images.unsplash.com/photo-1741851374655-3911c1b0e95a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2fHx8ZW58MHx8fHx8',
    },
    {
      'name': 'Farheen',
      'time': 'Today, 12:28 PM',
      'image':
      'https://images.unsplash.com/photo-1742201877377-03d18a323c18?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMXx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Huma',
      'time': 'Today, 12:20 PM',
      'image':
      'https://plus.unsplash.com/premium_photo-1726822827200-607b798be34e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Sakeena',
      'time': 'Today, 11:58 AM',
      'image':
      'https://plus.unsplash.com/premium_photo-1676977395508-9eec938ef7ee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxN3x8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Dania',
      'time': 'Today, 11:39 AM',
      'image':
      'https://plus.unsplash.com/premium_photo-1722169898897-b887c5548223?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.08,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1741606552241-fbd67e574f7f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: screenWidth * 0.025,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.add,
                        size: screenWidth * 0.03, color: Colors.white),
                  ),
                ),
              ],
            ),
            title: Text('My Status',
                style: TextStyle(fontSize: screenWidth * 0.045)),
            subtitle: Text('Tap to add status update',
                style: TextStyle(fontSize: screenWidth * 0.035)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Recent updates',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ...recentStatuses
              .map((status) => buildStatusTile(status, screenWidth, true))
              .toList(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Viewed updates',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ...viewedStatuses
              .map((status) => buildStatusTile(status, screenWidth, false))
              .toList(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.grey[300],
            mini: true,
            child: const Icon(Icons.edit, color: Colors.black),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.teal,
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildStatusTile(
      Map<String, String> status, double screenWidth, bool isRecent) {
    return ListTile(
      leading: Container(
        width: screenWidth * 0.15,
        height: screenWidth * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
          Border.all(color: isRecent ? Colors.green : Colors.grey, width: 2),
          image: DecorationImage(
            image: NetworkImage(status['image']!),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(status['name']!,
          style: TextStyle(fontSize: screenWidth * 0.045)),
      subtitle: Text(status['time']!,
          style: TextStyle(fontSize: screenWidth * 0.035)),
    );
  }
}
