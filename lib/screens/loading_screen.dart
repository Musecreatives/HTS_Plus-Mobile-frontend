import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    Timer(const Duration(seconds: 10), () {
      // Navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(), 
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Use Stack for overlaying elements
        fit: StackFit.expand, // Make background image cover the entire screen
        children: [
          // Background Image
          Image.asset(
            'assets/images/loading_screen.png',
            fit: BoxFit.cover,
          ),
          // Semi-Transparent Overlay
          Container(
            // Add a semi-transparent overlay for better readability
            color: Colors.white.withOpacity(0.5), // Adjust opacity as needed
          ),
          // Logo and Text Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/hts_logo.png',
                  width: 120,
                ),
                const SizedBox(height: 100),
                const Text(
                  'Your premier online\ngrocery platform',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 150),
                const SizedBox(
                  width: 50,
                  height: 50,
                  child: const CircularProgressIndicator(
                      color: Colors.orange, strokeWidth: 5,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
