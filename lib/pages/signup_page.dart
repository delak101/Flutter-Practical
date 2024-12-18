import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Save user data in SharedPreferences
  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _signUp() {
    if (!(_formKey.currentState!.validate())) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        _showMessage("Please fill in all fields.");
        return;
      }

      if (password != confirmPassword) {
        _showMessage("Passwords do not match!");
        return;
      }

      // Save data and provide success feedback
      _saveData();
      _showMessage("Sign up successful!");
      // // Navigate to Login or Home page if required
    }
  }

  // Show a message using SnackBar
  _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Username or Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) => value!.isEmpty ? 'email is required' : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8E8E8E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _signUp, // Handle sign-up logic
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
