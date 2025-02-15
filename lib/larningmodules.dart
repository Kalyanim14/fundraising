import 'package:flutter/material.dart';
import 'transactions.dart';
import 'startHere.dart';
import 'Rewards.dart';

import 'Feedback.dart';
import 'FAQ.dart';
import 'Dashboard.dart';

class LearningModules extends StatefulWidget {
  const LearningModules({super.key});

  @override
  State<LearningModules> createState() => _LearningModulesState();
}

class _LearningModulesState extends State<LearningModules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning Modules')),
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
                    builder: (context) => const FeedbackPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Learn with us!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
