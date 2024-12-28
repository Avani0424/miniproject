import 'package:flutter/material.dart';
import 'package:miniproject/curriculum.dart';
import 'package:miniproject/selectscreen.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final TextEditingController _skillsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.02;
    double buttonWidth = screenWidth * 0.3;
    double buttonPaddingVertical = screenHeight * 0.015;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAD9CD0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Selectscreen(),
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
          },
        ),
        title: const Text(
          'Skills',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(horizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What skills do you want to add?",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: verticalPadding),
              Text(
                "Get help writing your bullet points.",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: verticalPadding),
              TextFormField(
                controller: _skillsController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: const Color(0xFFFDECEF),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some skills';
                  }
                  return null;
                },
              ),
              SizedBox(height: verticalPadding),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Curriculum(),
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
                    backgroundColor: const Color(0xFF4B0082),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: buttonWidth * 0.2,
                      vertical: buttonPaddingVertical,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
