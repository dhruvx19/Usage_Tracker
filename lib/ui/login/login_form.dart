import 'package:assignment/constants/custom_snackbar.dart';
import 'package:assignment/repos/user_repo.dart';
import 'package:assignment/widgets/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginService _loginService = LoginService();
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 5.0,
        child: Container(
          padding: const EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Let's Secure Your PC",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.4,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.7),
                      width: 0.4,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.4,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.7),
                      width: 0.4,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [Flexible(child: TermsConditions())],
              ),
              const SizedBox(height: 40),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF161639),
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: isProcessing
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//check login status
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    if (isAuthenticated && mounted) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  //method for login and handling error ans exceptions
  Future<void> _login() async {
  setState(() {
    isProcessing = true;
  });

  final username = _usernameController.text;
  final password = _passwordController.text;

  if (username.isEmpty || password.isEmpty) {
    setState(() {
      isProcessing = false;
    });
    if (mounted) {
      CustomSnackbar.show(context, 'Both fields are required.');
    }
    return;
  }

  try {
    final isSuccess = await _loginService.login(username, password);

    if (mounted) {
      if (isSuccess) {
        // Save the username and authentication status
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isAuthenticated', true);
        //save the username to use in the dashboard page
        await prefs.setString('username', username);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/dashboard');
          }
        });
      } else {
        CustomSnackbar.show(context, 'Invalid username or password.');
      }
    }
  } catch (e) {
    if (mounted) {
      CustomSnackbar.show(context, 'An error occurred. Please try again later.');
    }
  } finally {
    if (mounted) {
      setState(() {
        isProcessing = false;
      });
    }
  }
}

}
