import 'package:flutter/material.dart';
import 'package:my_app/pages/account_page.dart';
import 'package:my_app/pages/game_page.dart';
import 'package:my_app/pages/ticket_page.dart';
import 'package:my_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Betting App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        hintColor: Colors.amber,
      ),
      home: const CryptoHomePage(),
    );
  }
}

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  _CryptoHomePageState createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const LotteryMenuPage(),
    UFCBettingPage(), // Changed from const GamesPage()
    BettingTicketsApp(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.menu),
                const SizedBox(width: 8),
                Image.asset('assets/images/Bitcoin.svg.webp', height: 30),
                const SizedBox(width: 8),
                const Text('Crypto Betting App'),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('Sign Up / Log In',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class LotteryMenuPage extends StatelessWidget {
  const LotteryMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Crypto Betting App!',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Pick your bets on various crypto markets and see if luck is on your side today!',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              const Divider(thickness: 2, height: 20),
              Text(
                'How to Play:',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Text(
                'Select your favorite cryptocurrencies, place your bet, and wait for the results. The closer your bets to the actual market values, the higher your winnings!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Game')),
            DataColumn(label: Text('Winning Numbers')),
            DataColumn(label: Text('Jackpot')),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Crypto Rush')),
                DataCell(Text('5, 17, 23, 25, 34, 48, 50')),
                DataCell(Text('\$10 Million')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Bitcoin Blast')),
                DataCell(Text('3, 12, 21, 29, 38, 45')),
                DataCell(Text('\$5 Million')),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
      ),
      body: const Center(
        child: Text('Welcome to the Games Page!'),
      ),
    );
  }
}

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: const Center(
        child: Text('Welcome to the Tickets Page!'),
      ),
    );
  }
}
