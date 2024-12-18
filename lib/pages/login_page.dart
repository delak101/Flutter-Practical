import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Load stored email and password from SharedPreferences
  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
    });
  }

  // Validate input and perform login check
  _login() async {
    print("aa ${_formKey.currentState!.validate()}");
    if ((_formKey.currentState!.validate())) {
      final prefs = await SharedPreferences.getInstance();
      final storedEmail = prefs.getString('email') ?? '';
      final storedPassword = prefs.getString('password') ?? '';

      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        _showMessage('Please fill all fields!');
      } else if (_emailController.text == storedEmail &&
          _passwordController.text == storedPassword) {
        _showMessage('Login successful!');
        // Navigate to the home page or next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        _showMessage('Invalid email or password!');
      }
    }
  }

  // Show a simple SnackBar message
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
              validator: (value) => value!.isEmpty ? 'Email is required' : null,
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
                  value!.isEmpty ? 'password is required' : null,
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
                onPressed: _login, // Call _login function
                child: const Text(
                  "Log In",
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
