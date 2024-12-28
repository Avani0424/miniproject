import 'package:flutter/material.dart';
import 'package:miniproject/skills.dart';
import 'package:provider/provider.dart';
import 'resume_provider.dart'; // Import the ResumeProvider

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAD9CD0), // Violet shade
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Achievements',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Briefly summarize your professional achievements",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Get help writing your bullet points.",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // Using Consumer to read and update the provider's value
            Consumer<ResumeProvider>(
              builder: (context, resumeProvider, child) {
                return TextField(
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    fillColor: const Color(0xFFFDECEF), // Background color
                    filled: true,
                  ),
                  controller: TextEditingController(
                    text: resumeProvider.achievements,
                  ),
                  onChanged: (value) {
                    resumeProvider
                        .updateAchievements(value); // Update achievements
                  },
                );
              },
            ),
            SizedBox(height: screenHeight * 0.03),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Validate if achievements are provided
                  if (Provider.of<ResumeProvider>(context, listen: false)
                      .achievements
                      .isEmpty) {
                    // Show a Snackbar if the field is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Please provide your achievements')),
                    );
                  } else {
                    // Proceed to the next screen if achievements are not empty
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Skills(), // Next page
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var tween = Tween(begin: 0.0, end: 1.0);
                          var fadeAnimation = animation.drive(tween);

                          return FadeTransition(
                            opacity: fadeAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF4B0082), // Darker violet for button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08,
                    vertical: screenHeight * 0.015,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
