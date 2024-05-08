import 'package:flutter/material.dart';

void main() => runApp(AccountPageApp());

class AccountPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileHeader(),
            AccountInfo(),
            Divider(),
            SettingsOptions(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
                'https://example.com/profile.jpg'), // Change the URL
          ),
          SizedBox(height: 10),
          Text(
            'John Doe',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'john.doe@example.com',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InfoTile(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: '+1 123 456 7890',
          ),
          InfoTile(
            icon: Icons.location_on,
            title: 'Address',
            subtitle: '123 Main Street, Springfield, USA',
          ),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  InfoTile({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

class SettingsOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTile(
          icon: Icons.lock,
          title: 'Change Password',
          onTap: () {
            // Handle onTap
          },
        ),
        SettingTile(
          icon: Icons.notifications,
          title: 'Notifications',
          onTap: () {
            // Handle onTap
          },
        ),
        SettingTile(
          icon: Icons.logout,
          title: 'Log Out',
          onTap: () {
            // Handle onTap
          },
        ),
      ],
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  SettingTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
