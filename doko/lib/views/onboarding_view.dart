import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          _buildPage(
            context,
            'Welcome to Doko Platter',
            'Order your favorite food easily',
            Icons.fastfood,
          ),
          _buildPage(
            context,
            'Fast Delivery',
            'Get your food delivered quickly',
            Icons.delivery_dining,
          ),
          _buildPage(
            context,
            'Fresh and Local',
            'Enjoy locally sourced meals',
            Icons.restaurant,
          ),
        ],
      ),
      bottomSheet: Container(
        height: 60,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/signup');
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }
  Widget _buildPage(BuildContext context, String title, String subtitle, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: Colors.orange),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(subtitle, textAlign: TextAlign.center),
      ],
    );
  }
}
