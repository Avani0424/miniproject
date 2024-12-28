import 'package:flutter/material.dart';

class ResumeProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _age = '';
  String _phoneNumber = '';
  String _city = '';
  String _country = '';
  String _achievements = ''; // Add achievements field

  // Getters for each field
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get age => _age;
  String get phoneNumber => _phoneNumber;
  String get city => _city;
  String get country => _country;
  String get achievements => _achievements; // Getter for achievements

  // Methods to update each field
  void updateFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updateAge(String value) {
    _age = value;
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void updateCity(String value) {
    _city = value;
    notifyListeners();
  }

  void updateCountry(String value) {
    _country = value;
    notifyListeners();
  }

  // Method to update achievements
  void updateAchievements(String value) {
    _achievements = value;
    notifyListeners();
  }
}
