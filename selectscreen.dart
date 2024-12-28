import 'package:flutter/material.dart';
import 'package:miniproject/acheivements.dart';
import 'package:miniproject/curriculum.dart';
import 'package:miniproject/education.dart';
import 'package:miniproject/inputscreen.dart';
import 'package:miniproject/skills.dart';
import 'package:miniproject/workdetails.dart';

class Selectscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAD9CD0),
        title: Text(
          "Resume Sections",
          style: TextStyle(fontSize: screenWidth * 0.06), // 6% of screen width
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth * 0.04, // 4% of screen width
            mainAxisSpacing: screenHeight * 0.02, // 2% of screen height
            childAspectRatio: 1.0, // Keeps the aspect ratio square (1:1)
            children: [
              SectionBox(
                title: "Personal Details",
                imagePath: "assets/images/person.png",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Inputscreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              SectionBox(
                title: "Qualification",
                imagePath: "assets/images/qualification.png",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Education(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              SectionBox(
                title: "Work History",
                imagePath: "assets/images/works.png",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Workdetails(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              SectionBox(
                title: "Achievements",
                imagePath: "assets/images/achievement.png",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          AchievementsPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              SectionBox(
                title: "Skills",
                imagePath: "assets/images/skill.png",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Skills(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              SectionBox(
                title: "Curriculum Vitae",
                imagePath: "assets/images/curriculum.png",
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Curriculum(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const SectionBox(
      {required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap, // Detect tap gesture
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 234, 196, 235),
              Color.fromARGB(255, 114, 37, 196),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image widget above the title
            Image.asset(
              imagePath,
              width: screenWidth * 0.18, // 18% of screen width
              height: screenWidth * 0.18, // 18% of screen width (square image)
            ),
            SizedBox(height: 8), // Space between image and text
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.05, // 5% of screen width
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
