import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Avatar with a button to change it
          ListTile(
            title: Text('Avatar'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://placekitten.com/200/200'), // Use your own avatar image
            ),
            trailing: ElevatedButton(
              onPressed: () {
                // Add logic to change avatar
              },
              child: Text('Change'),
            ),
          ),
          Divider(),
          // Username
          ListTile(
            title: Text('Username'),
            subtitle: Text('JohnDoe123'), // Replace with user's actual username
          ),
          Divider(),
          // Email
          ListTile(
            title: Text('Email'),
            subtitle: Text('johndoe@example.com'), // Replace with user's actual email
          ),
          Divider(),
          // News preferences
          ListTile(
            title: Text('News Preferences'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category 1'),
                Text('Category 2'),
                Text('Category 3'),
                // Add more categories as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

