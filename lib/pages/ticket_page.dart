import 'package:flutter/material.dart';

void main() => runApp(BettingTicketsApp());

class BettingTicketsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Betting Tickets',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      home: const TicketsPage(),
    );
  }
}

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Bet> bets = [
      Bet(fight: 'UFC 251: Usman vs. Masvidal', betOn: 'Usman', amount: 50, status: 'Won'),
      Bet(fight: 'UFC 254: Khabib vs. Gaethje', betOn: 'Khabib', amount: 100, status: 'Won'),
      Bet(fight: 'UFC 257: Poirier vs. McGregor', betOn: 'McGregor', amount: 75, status: 'Lost'),
      Bet(fight: 'UFC 260: Miocic vs. Ngannou', betOn: 'Ngannou', amount: 80, status: 'Won'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Bets'),
      ),
      body: ListView.builder(
        itemCount: bets.length,
        itemBuilder: (context, index) {
          return BetCard(bet: bets[index]);
        },
      ),
    );
  }
}

class Bet {
  final String fight;
  final String betOn;
  final double amount;
  final String status;

  Bet({
    required this.fight,
    required this.betOn,
    required this.amount,
    required this.status,
  });
}

class BetCard extends StatelessWidget {
  final Bet bet;

  const BetCard({super.key, required this.bet});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        title: Text(bet.fight),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bet On: ${bet.betOn}'),
            Text('Amount: \$${bet.amount.toStringAsFixed(2)}'),
          ],
        ),
        trailing: Text(
          bet.status,
          style: TextStyle(
            color: bet.status == 'Won' ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
