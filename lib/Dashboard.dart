import 'package:flutter/material.dart';
import 'transactions.dart';
import 'startHere.dart';
import 'Rewards.dart';
import 'larningmodules.dart';
import 'Feedback.dart';
import 'FAQ.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUser(1).then((data) {
      if (data != null) {
        setState(() {
          userData = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Dashboard(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Transactions'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Transactions(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Start Here'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const StartHere(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('FAQ'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const FAQ(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Learning Modules'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LearningModules(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Rewards'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Rewards(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Feedback'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const FeedbackPage(), // Renamed correctly
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userData == null
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("User ID: ${userData!['id']}"),
                      Text("Name: ${userData!['name']}"),
                    ],
                  ),
            const SizedBox(height: 20),
            const Text(
              'Welcome, User Name',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'Goal Achieved!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Add spacing
            ElevatedButton(
              onPressed: () {
                print('Copy Donation Link Pressed');
              },
              child: const Text('Copy Donation Link'),
            ),
            const SizedBox(height: 10), // Add spacing
            ElevatedButton(
              onPressed: () {
                print('Share Referral Code Pressed');
              },
              child: const Text('Share Referral Code'),
            ),
            const SizedBox(height: 10), // Add spacing
            ElevatedButton(
              onPressed: () {
                print('Share on WhatsApp Pressed');
              },
              child: const Text('Share on WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>?> fetchUser(int userId) async {
  final String apiUrl = "http://127.0.0.1:5000/user/$userId";

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body); // Convert JSON to Map
    } else {
      print("Error: ${response.body}");
      return null;
    }
  } catch (e) {
    print("Exception: $e");
    return null;
  }
}
