import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Dota-2.png',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 24),
            Text(
              'About This App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This app provides information about the diverse range of heroes in Dota 2. Explore the vast roster of heroes, learn about their unique abilities and attributes, and discover their roles in the intense battles of Dota 2. '
              'Stay updated with the latest hero statistics and delve into the rich lore of Dota 2. Whether you are a seasoned player or a curious enthusiast, this app is your gateway to the captivating world of Dota 2 heroes.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
