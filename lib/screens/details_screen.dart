import 'package:amolgic_assignment/app.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0A0A0A)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50,),
            Text(
              'add personal details',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Helps to verify your identity during ',
              style: TextStyle(
                fontSize: 16.0,
              ),

            ),
            Text(
              'account recovery.',style: TextStyle(
              fontSize: 16.0,
            ),

            ),
            SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Display Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(), // Spacer to push content to the top
            ElevatedButton(
              onPressed: () {
                // Add logic to handle the button action
                router.go('/home');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('AGREE TO CONTINUE'),
            ),
          ],
        ),
      ),
    );
  }
}
