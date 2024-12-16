import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Welcome to Doko Platter',
      'subtitle': 'Order your favorite food from us easily.',
      'image': 'assets/images/dp_logo.jpg', 
    },
    {
      'title': 'Fast Delivery',
      'subtitle': 'Get your meals delivered hot and fresh to your doorstep.',
      'image': 'assets/images/delivery.jpg', 
    },
    {
      'title': 'Fresh and Local',
      'subtitle': 'Support local businesses and enjoy the best local cuisines.',
      'image': 'assets/images/fresh_and_local.jpg', 
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipOnboarding() {
    _goToLogin();
  }

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final page = _onboardingData[index];
                return _buildOnboardingPage(
                  title: page['title']!,
                  subtitle: page['subtitle']!,
                  image: page['image']!,
                );
              },
            ),
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String title,
    required String subtitle,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250), // Replace with your assets
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPage > 0)
            TextButton(
              onPressed: _previousPage,
              child: Text(
                'Previous',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          else
            SizedBox(width: 80), // Placeholder for alignment

          if (_currentPage < _onboardingData.length - 1)
            TextButton(
              onPressed: _skipOnboarding,
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          else
            SizedBox(width: 80), // Placeholder for alignment

          ElevatedButton(
            onPressed: _nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            ),
            child: Text(
              _currentPage == _onboardingData.length - 1 ? 'Get Started' : 'Next',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
