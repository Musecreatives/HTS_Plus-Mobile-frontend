import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildOnboardingPage(
                'assets/images/onboarding_screen_1.png', // Replace with actual path
                'assets/images/hts_logo.png',
                'Fresh groceries\nand quality products\ndelivered in minutes',
                'The best delivery app in town for\ndelivering your daily fresh groceries',
              ),
              _buildOnboardingPage(
                'assets/images/onboarding_screen_2.png', // Replace with actual path
                'assets/images/hts_logo.png',
                'Fresh groceries\nand quality products\ndelivered in minutes',
                'The best delivery app in town for\ndelivering your daily fresh groceries',
              ),
              _buildOnboardingPage(
                'assets/images/onboarding_screen_2.png', // Replace with actual path
                'assets/images/hts_logo.png',
                'Fresh groceries\nand quality products\ndelivered in minutes',
                'The best delivery app in town for\ndelivering your daily fresh groceries',
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _pageController.jumpToPage(2),
                  child: const Text('Skip',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                      )),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const SlideEffect(
                    dotWidth: 30,
                    dotHeight: 8,
                    activeDotColor: Colors.orange,
                    dotColor: Color.fromARGB(0, 247, 195, 137),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      // Navigate to next screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10), // Adjust padding as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_currentPage == 2 ? 'Get Started' : 'Next',
                          style: const TextStyle(color: Colors.white)),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(
    String backgroundImagePath,
    String logoImagePath,
    String title,
    String description,
  ) {
    return Stack(
      // Use Stack to layer background and content
      fit: StackFit.expand,
      children: [
        Image.asset(
          backgroundImagePath,
          fit: BoxFit.cover,
        ),
        // Content (logo, title, description)
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                logoImagePath,
                width: 80,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
