import 'package:flutter/material.dart';
import 'input_screen.dart'; // Import the InputScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    // Navigate to InputScreen after a delay
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InputScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Opacity(
            opacity: _animation.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add logo here (Make sure to add the asset image in your pubspec.yaml)
                Image.asset(
                  'assets/images/logo.png',  // Replace with your actual logo path
                  width: 130,
                  height: 130,
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.favorite,
                  size: 90,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  'Amazing BMI Calculator',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your health, our priority',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 20),
                // Add a tagline or line about BMI
                Text(
                  'Calculate your BMI easily and stay healthy!',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
