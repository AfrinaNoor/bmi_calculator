import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;
  final double height;

  ResultScreen({required this.bmiResult, required this.height});

  // Function to determine BMI category
  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  // Function to calculate the healthy weight range for the given height
  String getHealthyWeightRange(double height) {
    double minHealthyWeight = 18.5 * height * height;
    double maxHealthyWeight = 24.9 * height * height;
    return '${minHealthyWeight.toStringAsFixed(1)} kg - ${maxHealthyWeight.toStringAsFixed(1)} kg';
  }

  // Function to determine color for BMI category
  Color getColorForCategory(double bmi) {
    if (bmi < 18.5) {
      return Colors.yellow;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else if (bmi >= 25 && bmi < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    String bmiCategory = getBMICategory(bmiResult);
    String healthyWeightRange = getHealthyWeightRange(height);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI Result'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent.shade200, Colors.lightBlue.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center( // Center widget to center all the content horizontally and vertically
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertically center the column
            crossAxisAlignment: CrossAxisAlignment.center, // Horizontally center the content
            children: [
              Icon(
                Icons.favorite,
                color: getColorForCategory(bmiResult), // Dynamic color based on BMI
                size: 70,
              ),
              SizedBox(height: 20),
              Text(
                'Your BMI is:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '${bmiResult.toStringAsFixed(2)} kg/m²',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'You are:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), // Semi-transparent background
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  bmiCategory,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: getColorForCategory(bmiResult),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Healthy BMI Range
              Text(
                'Healthy BMI range: 18.5 - 24.9 kg/m²',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Healthy weight range for your height: $healthyWeightRange',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              // Recalculate button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to input screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent[300],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Recalculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
