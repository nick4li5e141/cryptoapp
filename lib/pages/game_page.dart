import 'package:flutter/material.dart';

void main() => runApp(UFCBettingApp());

class UFCBettingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UFC Betting',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: UFCBettingPage(),
    );
  }
}

class UFCBettingPage extends StatelessWidget {
  final String fighter1 = 'Fighter A';
  final String fighter2 = 'Fighter B';
  final int score1 = 120;
  final int score2 = 130;
  final String winningSide = 'Fighter B';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UFC Betting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '$fighter1: $score1',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Text(
                    '$fighter2: $score2',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Winning Side: $winningSide',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Place bet on Fighter A
                placeBet(context, fighter1);
              },
              child: Text('Bet on $fighter1'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Place bet on Fighter B
                placeBet(context, fighter2);
              },
              child: Text('Bet on $fighter2'),
            ),
          ],
        ),
      ),
    );
  }

  void placeBet(BuildContext context, String fighter) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Placed bet on $fighter'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
